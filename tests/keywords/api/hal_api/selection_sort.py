def selection(arr):
    for i in range(len(arr)):
        min_value = i
        for j in range(i,len(arr)):
            if arr[j]<arr[min_value]:
                min_value = j
        temp = arr[i]
        arr[i] = arr[min_value]
        arr[min_value]=temp
    return arr

arrr = [10,0,9,8,50,60,70,50,60,70]
sss = selection(arrr)
print(sss)