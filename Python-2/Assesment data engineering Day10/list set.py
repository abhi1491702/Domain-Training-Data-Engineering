# 1. Using set() Method:

def unique(list1):
    # insert the list to the set
    list_set = set(list1)
    # convert the set to the list
    unique_list = list(list_set)
    for x in unique_list:
        print(x)

# driver code
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)

list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]
print("\nthe unique values from 2nd list is")
unique(list2)



# 2. Using reduce() function:

from functools import reduce

def unique(list1):
    # Print directly by using * symbol
    ans = reduce(lambda re, x: re+[x] if x not in re else re, list1, [])
    print(ans)

# driver code
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)

list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]
print("\nthe unique values from 2nd list is")
unique(list2)




# 3. Using operator.countOf() method:

import operator as op

def unique(list1):
    unique_list = []
    for x in list1:
        if op.countOf(unique_list, x) == 0:
            unique_list.append(x)
    for x in unique_list:
        print(x)

# driver code
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)

list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]
print("\nthe unique values from 2nd list is")
unique(list2)




# 4. Using pandas module:

import pandas as pd

def unique(list1):
    unique_list = pd.Series(list1).drop_duplicates().tolist()
    for x in unique_list:
        print(x)

# driver code
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)

list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]
print("\nthe unique values from 2nd list is")
unique(list2)



# 5. Using numpy.unique():

import numpy as np

def unique(list1):
    x = np.array(list1)
    print(np.unique(x))

# driver code
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)

list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]
print("\nthe unique values from 2nd list is")
unique(list2)



# 6. Using collections.Counter():

from collections import Counter

def unique(list1):
    # Print directly by using * symbol
    print(*Counter(list1))

# driver code
list1 = [10, 20, 10, 30, 40, 40]
print("the unique values from 1st list is")
unique(list1)

list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]
print("\nthe unique values from 2nd list is")
unique(list2)



# 7. Using dict.fromkeys():

# defining a list which consists of duplicate values
list1 = [10, 20, 10, 30, 40, 40]
list2 = [1, 2, 1, 1, 3, 4, 3, 3, 5]

# storing the result of the fromkeys() operation and converting it into list
unique_list_1 = list(dict.fromkeys(list1))
unique_list_2 = list(dict.fromkeys(list2))

# Printing the final result
print(unique_list_1, unique_list_2, sep="\n")


