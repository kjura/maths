# subpoint a
import random
from collections import Counter
from timeit import default_timer as timer

start = timer()
total_samples = 0
event = 0

for n in range(1000000):

    cards = ["BLUE", "RED"] * 10
    random.shuffle(cards)
    container = cards[:15]

    counter = dict(Counter(container))

    if 'RED' not in counter:
        counter['RED'] = 0

    if 'BLUE' not in counter:
        counter['BLUE'] = 0

    if counter['RED'] == 10 and counter['BLUE'] == 5:
        event += 1
        total_samples += 1
    else:
        total_samples += 1
end = timer()

print("Elapsed time")
print(end - start) # Time in seconds, e.g. 5.38091952400282
print(f"total samples: {total_samples}")
print(f"Event samples: {event}")
print(f"Pr(All red cards are assigned numbers less than or equal to 15) {event / total_samples}")

# Elapsed time python n = 1000000
# 4.641307645000779
# total samples: 1000000
# Event samples: 16325
# Pr(All red cards are assigned numbers less than or equal to 15) 0.016325

# Elapsed time C++ n = 1000000
# 525ms
# 525.727ms
# Total samples: 1000000
# Event samples: 16335
# Pr(All red cards are assigned numbers less than or equal to 15): 0.016335

# Elapsed time C++ n = 10000000
# 5142ms
# 5142.7ms
# Total samples: 10000000
# Event samples: 162644
# Pr(All red cards are assigned numbers less than or equal to 15): 0.0162644

# Elapsed time C++ n = 100000000
# 50933ms = 50,933 s 
# 50934ms
# Total samples: 100000000
# Event samples: 1625393
# Pr(All red cards are assigned numbers less than or equal to 15): 0.0162539

# Elapsed time Python n = 100000000
# 461.4824559509998
# total samples: 100000000
# Event samples: 1627670
# Pr(All red cards are assigned numbers less than or equal to 15) 0.0162767