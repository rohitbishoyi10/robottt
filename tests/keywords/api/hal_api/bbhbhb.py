def sentinel(lst, target):
    size = len(lst)
    lst.append(target)
    i = 0
    while(lst[i] != target):
        i += 1
    if(i == size):
        print("False")
    else:
        print(i)

ll = [1,2,3,4,5,6,7]
kk = 5
sentinel(ll,kk)