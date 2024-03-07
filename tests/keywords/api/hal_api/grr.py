test_dict = {'gfg': 10, 'is': 15, 'best': 20, 'for': 10, 'geeks': 20}

# printing original dictionary
print("The original dictionary is : " + str(test_dict))

# Remove duplicate values in dictionary
# Using dictionary comprehension
temp = {val: key for key, val in test_dict.items()}
print(temp)
res = {val: key for key, val in temp.items()}

# printing result
print("The dictionary after values removal : " + str(res))