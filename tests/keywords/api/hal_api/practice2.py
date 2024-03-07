test_dict = {'gfg': 10, 'is': 15, 'best': 20, 'for': 10, 'geeks': 20}
sseet = test_dict.items()
seet = set()
new_dcct = {}
for i,j in sseet:
    # if j not in seet:
    if j not in new_dcct.values():
        # seet.add(j)
        new_dcct[i] = j
print(new_dcct)



# new_dict = dict()
# ttpp = []
#
# for i,j in test_dict.items():
#     if j not in ttpp:
#         ttpp.append(j)
#         new_dict[i] = j
#
# print(new_dict)
