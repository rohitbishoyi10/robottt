def quick_srt(arr):
    if len(arr)<=1:
        return arr
    else:
            pivot = arr.pop()
    #       pivot = arr[len(arr) // 2]
    #       print(pivot)

    ss = []
    dd = []
    for i in arr:
        if i<pivot:
            ss.append(i)
        else:
            dd.append(i)
    # for j in arr:
    #     if j > pivot:
    #         dd.append(j)
    return quick_srt(ss) + [pivot] +quick_srt(dd)

    # left = [x for x in arr if x<pivot]
    # right = [x for x in arr if x>pivot]
    # return quick_srt(left) + [pivot] + quick_srt(right)

ff = [4,3,2,7,6]
d = quick_srt(ff)
print(d)








