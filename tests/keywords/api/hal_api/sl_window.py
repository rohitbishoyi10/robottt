lst = [1, 2, 3, 4, 5, 6, 7, 8]
ss = "hnfguruguuuuu"
print(len(lst)-3+1)


def sliding_window(elements, window_size):
    if len(elements) <= window_size:
        return elements
    for i in range(len(elements)-window_size+1 ):
        print(elements[i: i+window_size])


sliding_window(ss, 4)