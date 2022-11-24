

import time
import torch
torch.set_num_threads(1)

for i in range(1, 50):
    size = 1000 * i

    x = torch.rand(size, requires_grad=True)

    first_layer = torch.nn.Linear(size, size)
    second_layer = torch.nn.Linear(size, 2)
    softmax = torch.nn.Softmax(dim=0)

    avg = 0
    runs = 5
    for k in range(runs):
        start = time.time()

        t = first_layer(x)
        t = second_layer(t)
        t = softmax(t)

        t = torch.sum(t)
        t.backward()

        end = time.time()
        avg += end - start
        # print(f"  {end - start:.2}s")
    avg /= runs
    print(f"{i}, {int(avg*1000)}")
