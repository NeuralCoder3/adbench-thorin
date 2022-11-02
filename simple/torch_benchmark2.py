


import torch
import time

for i in range(100, 110):
    size = 300 * i

    x = torch.rand(size, requires_grad=True)

    first_layer = torch.nn.Linear(size, size)
    softmax = torch.nn.Softmax(dim=0)

    start = time.time()

    x2 = first_layer(x)
    x3 = softmax(x2)

    x4 = torch.sum(x3)
    x4.backward()

    end = time.time()
    print( int((end - start) * 1000))