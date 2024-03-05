def min_max_sum(input):
    min = input[0]
    max = input[0]
    for i in input:
        if min < i:
            min = i
        if max > i:
            max = i

    return min+max
print(min_max_sum([1,2,3,4]))

