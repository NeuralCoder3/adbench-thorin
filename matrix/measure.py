import subprocess



for i in range(0, 110):
    size = 300 * i
    size_str = str(size)
    subprocess.run(["../build/matrix/matrix_impala", size_str, size_str])

