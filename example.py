


import torch
import time

for i in range(1, 50):
    size = 1000 * i

    torch.set_num_threads(1)
    x = torch.rand(size, requires_grad=True)

    first_layer = torch.nn.Linear(size, size)
    second_layer = torch.nn.Linear(size, 2)
    softmax = torch.nn.Softmax(dim=0)

    start = time.time()

    x = first_layer(x)
    x = second_layer(x)
    x = softmax(x)

    x = torch.sum(x)
    x.backward()

    end = time.time()
    print( int((end - start) * 1000))