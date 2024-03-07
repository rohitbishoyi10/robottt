def linearr (arr,num):
    #
    i = 0
    while i<len(arr):
        if arr[i] == num:
            print(i)
        i=i+1
    return False

arrr = [1,2,3,4,5,6,7,5]
num_tofind = 5
# lennn = len(arrr)

linearr(arrr,num_tofind)