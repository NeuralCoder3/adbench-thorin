from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
import tensorflow as tf
import time


for i in range(1, 50):
    size = 1000 * i

    # torch.set_num_threads(10)
    # x = torch.rand(size, requires_grad=True)

    # model = NeuralNetwork(size)
    model = Sequential()
    # model.add(tf.keras.Input(shape=(size,)))
    model.add(Dense(size, input_shape=(size,), activation='linear'))
    model.add(Dense(2, activation='softmax'))

    x = tf.random.uniform((1, size,))
    # x = tf.random.uniform((size,), minval=0, maxval=1, dtype=tf.dtypes.float32)
    # x = tf.reshape(x, [size])

    avg = 0
    runs = 5
    for k in range(runs):
        start = time.time()

        # persistent=True
        with tf.GradientTape() as tape:
            t = model(x)
            t = tf.reduce_sum(t)
            g = tape.gradient(t, model.trainable_variables)
            # print(g)
        # t = model(x)
        # t.backward()

        end = time.time()
        avg += end - start
        # print(f"  {end - start:.2}s")
    avg /= runs
    print(f"{i}, {int(avg*1000)}")
