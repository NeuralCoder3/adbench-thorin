import subprocess



for i in range(74, 75):
    size = 300 * i
    size_str = str(size)
    subprocess.run(["../build/gmm/enzyme/gmm_enzyme", size_str, size_str])

