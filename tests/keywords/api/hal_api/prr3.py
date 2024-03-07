hh = [1,2,3,4,4,19,5,6,7,7,0]
ss = {}
ll = []
rr = {}
# ss = reduce(lambda x,y:"true"if x>y else "false",hh)
# print(ss)
# for count in hh:
#     if ss.get(count):
#         ss[count] = ss[count]+1
#     else:
#         ss[count] = 1
# print(ss)
# for i,j in ss.items():
#     if j>1:
#         # ll.append(i)
#         rr[i]=j
# print(rr)
def vvv (s):
    x = hh[0]
    for count in s:
        if count < x:
            x = count
    print(x)
    return

vvv(hh)