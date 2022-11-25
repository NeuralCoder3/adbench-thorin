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

def num_var(n, d, k):
    return k + d * k + (k * ( d * (d + 1) / 2 )) + d * n

list.sort(key=lambda x: num_var(1000, x[0],x[1]))


#let alphas_size = k;
#let means_size = (d*k);
#let icf_size = (k * ( d * (d + 1) / 2 )) ;
#let x_size = (d*n);

for (d, k) in list:
    subprocess.run(["../build/gmm/enzyme/gmm_enzyme" , "../benchmark/gmm/" + filename('1k', d, k)])
