def binnary_seerch(arr,lb,ub,num_find):

    if lb<=ub:
        mid = (lb+ub)//2
        if arr[mid] == num_find:
            return mid
        elif arr[mid] > num_find:
            return binnary_seerch(arr,lb,mid-1,num_find)
        else:
            return binnary_seerch(arr, mid+1, ub, num_find)
    else:
        return -1

arrrr = [11,12,13,14,15,16]
resu = binnary_seerch(arrrr,0,len(arrrr)-1,700)
if resu!=-1:
    print(str(resu))
else:
    print("False...")