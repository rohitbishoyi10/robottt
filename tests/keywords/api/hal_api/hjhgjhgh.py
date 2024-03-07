def mettt(arr,find_num):
    if find_num < arr[0] or find_num > arr[len(arr)-1] or not arr:
        print("jdhnfjhfhe")
        return -1
    mid = (0 + len(arr)) // 2
    if arr[mid] == find_num:
        return mid
    elif arr[mid] < find_num:
        return mid + 1 + mettt(arr[mid + 1:], find_num)
    else:
        return mettt(arr[:mid], find_num)

arrrr = [1,2,3,4,9]
find = 7
print(mettt(arrrr,find))