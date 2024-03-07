arr = [1,2,2,3,4,5,6,7,8,8,7,9,9]

dict = {}

op = []

for i in arr:
    if dict.get(i):
        dict[i] = dict[i] + 1
    else:
        dict[i] = 1

print(dict)

for i,j in dict.items():
    if j<2:
        op.append(i)

print(op)
