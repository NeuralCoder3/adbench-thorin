import subprocess
import sys, time
import io
import csv
from dataclasses import dataclass
import re


d_list = [2, 10, 20, 32, 64]
k_list = [5, 10, 25, 50, 100, 200]

d_list = [2, 10, 20, 32, 64]
k_list = [5, 10, 25, 50, 200]

n_list = ['1k', '10k', '2.5M']

def gmm_filename(n, d, k):
    return "{}/gmm_d{}_K{}.txt".format(n,d,k)

def lstm_filename(l, c):
    return "lstm_l{}_c{}.txt".format(l, c)

gmm_list = []

for k in k_list:
    for d in d_list:
        gmm_list.append((d, k))

def param_count(d,k):
    return k + d*k +  (k * ( d * (d + 1) // 2 ))

gmm_list.sort(key=lambda x: param_count(x[0], x[1]))

benchmark_folder = "benchmark/"
build_folder = "build/"
#bins = ["impala/native/gmm_impala", "enzyme/gmm_enzyme"]

bins = {
    "nn" : {
        "impala": build_folder + "nn/impala/native/nn_impala",
        "impala-raw": build_folder + "nn/impala/native/nn_raw_impala",
        "impala-grad": build_folder + "nn/impala/native/nn_grad_impala",
        "impala-war": build_folder + "nn/impala/native/nn_war_impala",
        "impala-dep": build_folder + "nn/impala/native/nn_dep_impala",
        "impala-war-dep": build_folder + "nn/impala/native/nn_war_dep_impala",
        "enzyme": build_folder + "nn/enzyme/nn_enzyme",
        "torch": "python3 nn/torch/torch_nn.py"
    },
    "gmm" : {
        "impala": build_folder + "gmm/impala/native/gmm_impala",
        "impala-fix": build_folder + "gmm/impala/native/gmm_impala_fix",
        "enzyme": build_folder + "gmm/enzyme/gmm_enzyme",
        "manual": build_folder + "gmm/manual/gmm_manual",
        "torch" : "python3 gmm/torch/main.py GMM"
    },
    "ba" : {
        "impala": build_folder + "ba/impala/native/ba_impala",
        "enzyme": build_folder + "ba/enzyme/lstm_enzyme",
        "manual": build_folder + "ba/manual/ba_manual",
        "torch" : "python3 gmm/torch/main.py BA"},
    "lstm" : {
        "impala": build_folder + "lstm/impala/native/lstm_impala",
        "enzyme": build_folder + "lstm/enzyme/lstm_enzyme",
        "manual": build_folder + "lstm/manual/lstm_manual",
        "torch" : "python3 gmm/torch/main.py LSTM"
    }
}


@dataclass
class Result:
    def __init__(self, args, bin, type, time, memory, gradients):
        self.args = args
        self.bin = bin
        self.type = type
        self.time = time
        self.memory = memory
        self.gradients = gradients
        self.max_error = 0.0

def benchmark_path(type, filename):
    return benchmark_folder + type + "/" + filename

def args_to_benchmark(type, args):
    if type == "gmm":
        return [benchmark_path("gmm", gmm_filename('10k', args[0], args[1]))]
    elif type == "nn":
        return args
    elif type == "lstm":
        return [benchmark_path("lstm", lstm_filename(args[0], args[1]))]


results = {}
def add_result(result):
    if result.type not in results:
        results[result.type] = {}

    type_results = results[result.type]

    if result.bin not in type_results:
        type_results[result.bin] = []

    bin_results = type_results[result.bin]
    bin_results.append(result)

def memory(benchmark):
    proc = subprocess.Popen(["ps", "-o", "rss", "-p", str(benchmark.pid)], stdout=subprocess.PIPE)

    max = -1
    while True:
        poll = benchmark.poll()
        if poll is not None:
            return max
        try:
            outs, errs = proc.communicate(timeout=1)
            lines = list(filter(len, outs.decode("utf-8").replace(" ", "").split('\n')))
            if len(lines) != 2:
                return max
            new_mem = int(lines[1])

            print("measure" + str(new_mem))

            if max < new_mem:
                max = new_mem
            time.sleep(0.05)
        except subprocess.TimeoutExpired:
            return max

def run_task(bin, type, args):
    bin_path = bins[type][bin].split(" ")
    proc = subprocess.Popen(["/usr/bin/time", "-l" , *bin_path, *args_to_benchmark(type, args)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    #print(proc.pid)

    #print("memory: {}".format(memory(proc)))


    gradients = None
    time = -1
    memory = -1

    try:
        outs, errs = proc.communicate(timeout=100)
        gradients = list(filter(len, outs.decode("utf-8").replace(" ", "").split('\n')))
        profiler = list(map( lambda x: re.split('\s+', x), filter(len, map(lambda x: x.strip(), errs.decode("utf-8").split('\n')))))

        memory = int(profiler[-1][0])

        print("memory: {}".format(memory))
        if len(gradients) > 0:
            time_str = gradients[0]
            time = int(time_str)
            gradients = [float(x) for x in gradients[1:]]
    except subprocess.TimeoutExpired:
        proc.kill()

    return Result(args, bin, type, time, memory, gradients)

def run_and_error(bin, type, args, pattern, measure = True):
    last_time = 0
    for arg in args:
        if last_time == -1:
            error_result = Result(arg, bin, type, -1, -1, None)
            add_result(error_result)
            continue

        print(pattern.format(*arg))
        result = run_task(bin, type, arg)

        add_result(result)

        if measure and result.gradients is not None:
            manual = run_task("manual", type, arg)
            max_error = 0.0
            for (left, right) in zip(manual.gradients, result.gradients):
                error = abs(left - right) / max(1, abs(left) + abs(left))
                max_error = max(error, max_error)

            manual.gradients = None
            result.max_error = max_error
        result.gradients = None
        last_time = result.time
        print(result.time)

def run_gmm(bin):


    variants = [bin]
    if bin == "impala":
        variants = ["impala", "impala-fix"]


    for variant in variants:
        print(variant)
        run_and_error(variant, "gmm", gmm_list, "d={}, k={}")


def run_nn(bin):
    if bin in ["manual"]:
        return

    variants = [bin]
    if bin == "impala":
        variants = ["impala-dep",  "impala-war-dep", "impala-war", "impala-grad"]
        #variants = ["impala-dep"]

    args = [[str(28 * 28), str(20000 * i), "10"] for i in range(1,60)]
    for variant in variants:
        print(variant)
        run_and_error(variant, "nn", args, "{1}", False)



def run_lstm(bin):
    run_and_error( bin, "lstm", [(2, 1024), (2, 4096), (4, 1024), (4, 4096)], "l={}, c={}")

def write_result():
    for [type, type_results] in results.items():
        with open(type + '.csv', 'w', newline='') as csvfile:
            writer = csv.writer(csvfile, delimiter=',')

            header = ["x"]

            for bin in type_results.keys():
                header.append(bin + "_time")
                header.append(bin + "_memory")
                header.append(bin + "_error")

            writer.writerow(header)

            random_results = next(iter(type_results.values()))
            result_size = len(random_results)

            for i in range(result_size):
                row = []
                row.append(calc_x_value(i, random_results[i]))
                for item in type_results.values():
                    row.append(item[i].time)
                    row.append(item[i].memory)
                    row.append(item[i].max_error)

                writer.writerow(row)

def run(bin, type):
    if type == "gmm":
        run_gmm(bin)
    if type == "nn":
        run_nn(bin)
    if type == "lstm":
        run_lstm(bin)


def calc_x_value(i, result):
    args =  result.args
    type = result.type
    if type == "gmm":
        return param_count(args[0], args[1])
    elif type == "nn":
        return args[1]
    elif type == "lstm":
        return i


def run_all():
    for benchmark in ["lstm"]:
        results.clear()
        print(benchmark)
        for bin in ["torch"]:
            print(bin)
            run(bin, benchmark)
        write_result()

run_all()


