
pos = -1
def binarry_searchh(arr,find_num):
    lb = 0
    ub = len(arr)-1
    mid =0
    while ub>=lb:
        mid = (lb + ub)//2
        if arr[mid] == find_num:
            return mid
        elif arr[mid] <find_num:
            lb = mid+1
        else:
            ub = mid-1
    return -1
ss = [1,2,3,4,5,6,11,13]
number = 4
ress = binarry_searchh(ss,number)
if ress !=-1:
   print(str(ress))
else:
   print("false")

