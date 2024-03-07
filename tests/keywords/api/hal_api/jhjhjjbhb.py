test_uni = [1,2,3,4,5,6,7,8,9,6,6,6,9]
jkjkjk = [3,4,5,6]
l1=[1,'a',2,'b',3,'c',4,'d']
l2 = l1[::2]
l3=l1[1::2]
ddd = zip(l2,l3)
print(dict(ddd))

# kk = dict(zip(test_uni,jkjkjk))
# print(kk)
# dd = dict(enumerate(test_uni,1000))
# sss = dict.fromkeys(test_uni,"klklkl")
# for i,j in sss.items():
#     print(i,j)
# lst = []
# mmm = {}
# sss = {}
#
# for i in test_uni:
#     if mmm.get(i):
#         mmm[i] = mmm[i] + 1
#     else:
#         mmm[i] = 1
#
# print(mmm)
# for k,v in mmm.items():
#     if v==1:
#         sss[k] = v
#
# print(sss)