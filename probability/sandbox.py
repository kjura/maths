

elemsAprime = list(range(17, 64 + 1))
elemsBprime = list(range(2, 16 + 1)) + list(range(32, 64 + 1))
elemsCprime = list(range(2, 31 + 1)) + list(range(47, 64 + 1)) 


def cardinality(indexes):
    count = 0
    for i in indexes:
        count += 1
        print(f'\u03C9_{i}')
    print(count)


cardinality(elemsCprime)