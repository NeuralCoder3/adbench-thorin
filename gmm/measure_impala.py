import subprocess

d_list = [2, 10, 20, 32, 64, 128]
k_list = [5, 10, 25, 50, 100, 200]
n_list = ['1k', '10k', '2.5M']

def filename(n, d, k):
    return "{}/gmm_d{}_K{}.txt".format(n,d,k)

list = []

for k in k_list:
    for d in d_list:
        list.append((d, k))

list.sort(key=lambda x: x[0] + x[1])


for (d, k) in list:
    subprocess.run(["../build/gmm/impala/native/gmm_impala" , "../benchmark/gmm/" + filename('1k', d, k)])


