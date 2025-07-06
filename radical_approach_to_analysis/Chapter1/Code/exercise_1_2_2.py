import numpy as np
import matplotlib.pyplot as plt

# ((-1)^(n-1)) / (2n - 1)
# np.cos((2n - 1) * (pi*x) / (2))

constant_factor = 4.0 / np.pi
n = 100
x_cases = np.array([0.0, 0.5, 0.9, 0.99, 1.1, 2.0])

# generator
iterable_zero = (
    ((-1)^(n-1)) / (2*n - 1) * np.cos((2*n - 1) * (np.pi * x_cases[0]) / (2)) for n in range(1, n)
    )

iterable_half = (
    ((-1)^(n-1)) / (2*n - 1) * np.cos((2*n - 1) * (np.pi * x_cases[1]) / (2)) for n in range(1, n)
    )

iterable_point_nine = (
    ((-1)^(n-1)) / (2*n - 1) * np.cos((2*n - 1) * (np.pi * x_cases[2]) / (2)) for n in range(1, n)
    )

iterable_point_ninety_nine = (
    ((-1)^(n-1)) / (2*n - 1) * np.cos((2*n - 1) * (np.pi * x_cases[3]) / (2)) for n in range(1, n)
    )

iterable_one_point_one = (
    ((-1)^(n-1)) / (2*n - 1) * np.cos((2*n - 1) * (np.pi * x_cases[4]) / (2)) for n in range(1, n)
    )

iterable_two = (
    ((-1)^(n-1)) / (2*n - 1) * np.cos((2*n - 1) * (np.pi * x_cases[5]) / (2)) for n in range(1, n)
    )



result_zero = constant_factor * np.fromiter(iterable_zero, float).sum()
result_half = constant_factor * np.fromiter(iterable_half, float).sum()
result_point_nine = constant_factor * np.fromiter(iterable_point_nine, float).sum()
result_point_ninety_nine = constant_factor * np.fromiter(iterable_point_ninety_nine, float).sum()
result_one_point_one = constant_factor * np.fromiter(iterable_one_point_one, float).sum()
result_two = constant_factor * np.fromiter(iterable_two, float).sum()


print(result_zero)
print(result_half)
print(result_point_nine)
print(result_point_ninety_nine)
print(result_one_point_one)
print(result_two)