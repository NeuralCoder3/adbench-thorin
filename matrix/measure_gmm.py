import subprocess

d_list = [2, 10, 20, 32, 64, 128]
k_list = [5, 10, 25, 50, 100, 200]
n_list = ['1k', '10k', '2.5M']

def filename(n, d, k):
    return "{}/gmm_d{}_K{}.txt".format(n,d,k)


for k in k_list:
    subprocess.run(["../build/matrix/matrix_impala" , "../benchmark/gmm/" + filename('2.5M', 2, k)])


