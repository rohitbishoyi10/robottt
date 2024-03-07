def insertion_sort(arr):
    for i in range(0,len(arr)):
        while arr[i-1]>arr[i] and i>0:
            arr[i - 1] , arr[i] = arr[i],arr[i-1]
            i-=1
    return arr


arr =[5,4,2,6,1,8,0]
s = insertion_sort(arr)
print(s)