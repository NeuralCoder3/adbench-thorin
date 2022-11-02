import torch
import time

for i in range(1, 100):
    size = 300 * i
    a = torch.rand(size, size, requires_grad=True)
    b = torch.rand(size, requires_grad=True)

    c = torch.matmul(a, b)

    sum = torch.sum(c)
    sum.backward()

    start = time.time()
    c = torch.matmul(a, b)

    sum = torch.sum(c)
    sum.backward()

    end = time.time()
    print( int((end - start) * 1000))