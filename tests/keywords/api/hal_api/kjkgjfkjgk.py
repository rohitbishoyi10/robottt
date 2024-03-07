test_dict = {'gfg': 10, 'is': 15, 'best': 20, 'for': 10, 'geeks': 20}
new_list = []
new_dict = {}
new_l = set()
for i,j in test_dict.items():
    if j not in new_dict.values():
        new_list.append(j)
        new_dict[i] = j
    else:
        new_l.add(j)
# for i in new_list:
#     if new_list.count(i)==1:
#         new_l.add(i)
print(new_l)
print(new_dict)
