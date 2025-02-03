import numpy as np
import matplotlib.pyplot as plt

# numpy version: 2.2.2
# matplotlib version: 3.10.0
# python version: 3.12.6

# Interval range -1 <= x <= 3.
domain = np.linspace(-1, 3, 500)


def f_a(x):
    return (4 / np.pi) * np.cos(np.pi * x / 2)

def f_b(x):
    return (4 / np.pi) * (np.cos(np.pi * x / 2) - (1/3)*np.cos(3*np.pi*x / 2))

def f_c(x):
    return (4 / np.pi) * (np.cos(np.pi * x / 2) - (1/3)*np.cos(3*np.pi*x / 2) + (1/5)*np.cos(5*np.pi*x / 2))

def f_d(x):
    return (4 / np.pi) * (np.cos(np.pi * x / 2) - (1/3)*np.cos(3*np.pi*x / 2) + (1/5)*np.cos(5*np.pi*x / 2) - (1/7)*np.cos(7*np.pi*x / 2))

# Fourier series in general
# Needs to be fixed for numpy vectorization capabilities
# def f_series(x, n):

#     if n < 1:
#         raise ValueError(f"n cannot be less than 1: n is {n}")

#     pi_fraction_factor = 4 / np.pi

#     # [1, 0.33(3), 0,11(1), ...]
#     cosine_coefficients = np.array([[np.pow(-1, i-1) / ((2*i) - 1) for i in range(1, n+1)]])

#     # [a1, a2, a3, ...]
#     cosine_values = np.array([[np.cos((((2*n) - 1) * np.pi * x) / 2) for i in range(1, n+1)]])

#     # Sum after multiplying element-wise eg. [a1, a2, a3] o [b1, b2, b3] = a1b1, a2b2, a3,b3
#     dot_product = np.dot(cosine_coefficients, cosine_values)


#     return (pi_fraction_factor * dot_product).flatten()

one_term = f_a(domain)
two_terms = f_b(domain)
three_terms = f_c(domain)
four_terms = f_d(domain)

# Just uncomment if you want a single plot
# fig, axs = plt.subplots(figsize=(20, 10))
# fig.suptitle('First four Fourier partial sums: n = 1, 2, 3, 4; over -1 <= x <= 3', size=25)
# axs.plot(domain, one_term, linewidth=2.0, color='blue', label='n=1')
# axs.plot(domain, two_terms, linewidth=2.0, color='red', label='n=2')
# axs.plot(domain, three_terms, linewidth=2.0, color='purple', label='n=3')
# axs.plot(domain, four_terms, linewidth=2.0, color='green', label='n=4')
# plt.legend(loc='upper right', fontsize=25)
# plt.show()


# Just uncomment if you want subplots 2x2, each term on a separate canvas
# fig, axs = plt.subplots(2, 2, figsize=(10, 5))
# fig.suptitle('First four Fourier partial sums: n = 1, 2, 3, 4; over -1 <= x <= 3', size=15)

# axs[0, 0].plot(domain, one_term, linewidth=2.0, color='blue')
# axs[0, 0].set_title('n=1')

# axs[0, 1].plot(domain, two_terms, linewidth=2.0, color='red')
# axs[0, 1].set_title('n=2')

# axs[1, 0].plot(domain, three_terms, linewidth=2.0, color='purple')
# axs[1, 0].set_title('n=3')

# axs[1, 1].plot(domain, four_terms, linewidth=2.0, color='green')
# axs[1, 1].set_title('n=4')
# fig.tight_layout()