import numpy as np
import matplotlib.pyplot as plt

# Author: nicelagrangian
# numpy version: 2.2.2
# matplotlib version: 3.10.0
# python version: 3.12.6

# Interval range -1 <= x <= 3.
domain = np.linspace(-1, 3, 500)

# Fourier series that equals to 1
def f_series(x, n):

    if n < 1:
        raise ValueError(f"n cannot be less than 1: n is {n}")

    pi_fraction_factor = 4 / np.pi

    # [1, 0.33(3), 0,11(1), ...]
    cosine_coefficients = np.array([[np.pow(-1, i-1) / ((2*i) - 1) for i in range(1, n+1)]])

    # [a1, a2, a3, ...]
    cosine_values = np.array([[np.cos((((2*n) - 1) * np.pi * x) / 2) for i in range(1, n+1)]])

    # Sum after multiplying element-wise eg. [a1, a2, a3] o [b1, b2, b3] = a1b1, a2b2, a3,b3
    dot_product = np.dot(cosine_coefficients, cosine_values)


    return (pi_fraction_factor * dot_product).flatten()

one_term = f_series(domain, 1)
two_terms = f_series(domain, 2)
three_terms = f_series(domain, 3)
four_terms = f_series(domain, 4)

# fig, ax = plt.subplots()
# ax.plot(domain, one_term)

# plot
fig, axs = plt.subplots(2, 2, figsize=(10, 5))
fig.suptitle('First four Fourier partial sums: n = 1, 2, 3, 4; over -1 <= x <= 3')

axs[0, 0].plot(domain, one_term, linewidth=2.0, color='blue')
axs[0, 0].set_title('n=1')

axs[0, 1].plot(domain, two_terms, linewidth=2.0, color='red')
axs[0, 1].set_title('n=2')

axs[1, 0].plot(domain, three_terms, linewidth=2.0, color='purple')
axs[1, 0].set_title('n=3')

axs[1, 1].plot(domain, four_terms, linewidth=2.0, color='green')
axs[1, 1].set_title('n=4')
fig.tight_layout()

plt.show()