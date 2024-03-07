def mergee_sort(arr):
    if len(arr)<=1:
        return arr
    hb = len(arr)
    mid = hb//2
    ls = arr[:mid]
    rs = arr[mid:]
    mergee_sort(ls)
    mergee_sort(rs)
    i,j,k=0,0,0
    while i<len(ls) and j<len(rs):
        if ls[i]<rs[j]:
            arr[k]=ls[i]
            i+=1
        else:
            arr[k]=rs[j]
            j+=1
        k+=1

    while i<len(ls):
        arr[k] = ls[i]
        i+=1
        k+=1
    while j<len(rs):
        arr[k]=rs[j]
        j+=1
        k+=1
    return arr


arrr = [4,3,20,0,8]
s = mergee_sort(arrr)
print(s)
