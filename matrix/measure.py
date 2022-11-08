import subprocess



for i in range(1, 100):
    size = 300 * i
    size_str = str(size)
    subprocess.run(["../build/matrix/matrix_impala", size_str, size_str, "2"])

