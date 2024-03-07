# Python program for implementation of the Selection sort algorithm

Array = [5, 6, 4, 2]

# loop to Traverse through all the elements in the given array
for i in range(len(Array)):

    # setting min_indx equal to the first unsorted element

    min_indx = i
    # Loop to iterate over un-sorted sub-array
    for j in range(i + 1, len(Array)):

        # Finding the minimum element in the unsorted sub-array
        if Array[min_indx] > Array[j]:
            min_indx = j

    # swapping the minimum element with the element at min_index to place it at its correct position    
    Array[i], Array[min_indx] = Array[min_indx], Array[i]

# Printing the modified array after the selection sort algorithm is applied

print(Array)

