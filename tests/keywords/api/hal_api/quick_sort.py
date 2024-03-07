inp = [22, 11, 88, 66, 55, 77, 33, 44]



def quick_sort(inp_arr:List):
    pivot = inp[len(inp_arr)]
    i = 0
    j = len(inp_arr) - 1

    while i<j 