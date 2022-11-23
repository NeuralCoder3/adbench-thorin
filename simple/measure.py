import subprocess



for i in range(1, 50):
    size = 1000 * i
    size_str = str(size)
    subprocess.run(["../build/gmm/enzyme/gmm_enzyme", size_str, size_str, "2", "0"])

