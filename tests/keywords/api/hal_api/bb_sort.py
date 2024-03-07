def bb_sort(arr):
    for i in range(len(arr)-1):
        for j in range(len(arr)-1):
            if(arr[j]<arr[j+1]):
                temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
    return arr

ll = [1,-3,4,5,3,2,1]
o = bb_sort(ll)
print(o)
