import os
from os import walk
import re
from collections import OrderedDict
import time
import matplotlib.pyplot as plt
import numpy as np

class Benchmark:
    def __init__(self, d, k, n, path):
        self.d = d
        self.k = k
        self.n = n
        self.path = path

    def __str__(self):
        return "{d} {k} {n} {path}".format(d=self.d, k=self.k, n=self.n, path=self.path)


def groupBy(list, key):
    res = OrderedDict()
    for benchmark in list:
        keyValue = key(benchmark)

        if keyValue in res:
            res[keyValue].append(benchmark)
        else:
            res[keyValue] = [benchmark]
    return res

def createBenchmarks():
    benchmarks = []

    for (dirpath, dirnames, filenames) in walk('benchmark/gmm/1k'):
        for file in filenames:
            if file.endswith('txt'):
                path = 'benchmark/gmm/1k/' + file
                f = open(path, "r")
                line = f.readline()
                (d, k, n) = line.split()
                benchmarks.append(Benchmark(int(d),int(k),int(n), path))
                f.close()
    return benchmarks

def runBenchmark(command, benchmark):
    os.system(command + ' ' + benchmark.path + ' > /dev/null')

def runCommands(commands, benchmark, reps = 1):
    #print(benchmark.path)
    print("{d};{k};{n};".format(d=benchmark.d, k=benchmark.k, n=benchmark.n), end="")
    measurements = []
    if benchmark.d < 10 or True:
        measurements.append(benchmark.d)
        measurements.append(benchmark.k)
        measurements.append(benchmark.n)
        for command in commands:
            timeSum = 0
            for _ in range(reps):
                start = time.time()
                runBenchmark(command, benchmark)
                end = time.time()
                millis = (end - start) * 1000
                timeSum += millis
            avgTime = int(timeSum / reps)
            measurements.append(avgTime)
            print(avgTime, end=";")
    print()
    return measurements

def main():
    reps = 5

    benchmarks = createBenchmarks()

    commands = [
        "./build/gmm/manual/gmm_manual",
        #"./build/gmm/impala/native/gmm_enzyme",
        "./build/gmm/impala/enzyme/gmm_enzyme",
        "./build/gmm/enzyme/gmm_enzyme",
    ]

    labels = [
        "manual",
        "enzyme-impala",
        "enzyme-native"
    ]

    res = groupBy(benchmarks, key=lambda b: b.d)
    runs = []

    f = open("results/evaluation.csv", "w")


    for key in sorted(res.keys()):

        items = sorted(res[key], key=lambda a: a.k)

        for benchmark in items:
            measurements = runCommands(commands, benchmark, reps)
            runs.append(measurements)

    f.write(";".join(labels) + "\n")

    for run in runs:
        f.write(";".join([str(element) for element in run]) + "\n")

    f.close()


if __name__ == '__main__':
    main()