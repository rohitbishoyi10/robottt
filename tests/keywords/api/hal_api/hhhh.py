arr = [1,2,2,3,4,5,6,7,8,8,7,9]

# gg = {1:3,2:5}

# print(gg.get(1))
my_dict = {}
op = []
for i in arr:
    if my_dict.get(i) :
        my_dict[i] = my_dict[i] + 1
    else:
        my_dict[i] = 1

print(my_dict)
for i,j in my_dict.items():
    if j != 1:
        op.append(i)

print(op)
# op = []
# op2 = set()
# for i in arr:
#     prev_len = len(op2)
#     op2.add(i)
#     if len(op2) == prev_len:
#         op.append(i)
#
# print(op)

# xxx =[]
#
# gg = []
# for i in range(0,len(arr)):
#     if arr.count(i)>1:
#         xxx.append(arr[i])
# cc = list(set([i for i in arr if arr.count(i)>1]))
# print(cc)


