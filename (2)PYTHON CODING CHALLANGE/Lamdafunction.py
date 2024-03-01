# 1. Introduction to Python Lambda Functions
str1 = 'HexaforHexa'
upper = lambda string: string.upper()
print(upper(str1))

# 2. Condition Checking with Lambda
format_numeric = lambda num: f"{num:e}" if isinstance(num, int) else f"{num:,.2f}"
print("Int formatting:", format_numeric(1000000))
print("Float formatting:", format_numeric(999999.789541235))

# 3. Comparison with def Functions
def cube(y):
    return y*y*y
lambda_cube = lambda y: y*y*y
print("Using def function, cube:", cube(5))
print("Using lambda function, cube:", lambda_cube(5))

# 4. Practical Uses of Lambda Functions

## 4.1 Lambda Functions with List Comprehension
is_even_list = [lambda arg=x: arg * 10 for x in range(1, 5)]
for item in is_even_list:
    print(item())

## 4.2 Lambda Functions with if-else
Max = lambda a, b : a if(a > b) else b
print(Max(1, 2))



## 4.3 Lambda with Multiple Statements
List = [[2,3,4],[1, 4, 16, 64],[3, 6, 9, 12]]
sortList = lambda x: (sorted(i) for i in x)
secondLargest = lambda x, f : [y[len(y)-2] for y in f(x)]
res = secondLargest(List, sortList)
print(res)



# 5. Lambda Functions with Built-in Functions

## 5.1 Using lambda() Function with filter()
li = [5, 7, 22, 97, 54, 62, 77, 23, 73, 61]
final_list = list(filter(lambda x: (x % 2 != 0), li))
print(final_list)



## 5.2 Using lambda() Function with map()
li = [5, 7, 22, 97, 54, 62, 77, 23, 73, 61]
final_list = list(map(lambda x: x*2, li))
print(final_list)


## 5.3 Using lambda() Function with reduce()
from functools import reduce
li = [5, 8, 10, 20, 50, 100]
sum = reduce((lambda x, y: x + y), li)
print(sum)



# 6. Arbitrary Arguments and Keyword Arguments
def add(*args):
   s = 0
   for x in args:
      s += x
   return s

result = add(10, 20, 30, 40)
print(result)



# 7. Mixed Types of Arguments
def percent(math, sci, **optional):
   s = math + sci
   for k, v in optional.items():
      s += v
   return s / (len(optional) + 2)

result = percent(math=80, sci=75, Eng=70, Hist=65, Geo=72)
print("Percentage:", result)
