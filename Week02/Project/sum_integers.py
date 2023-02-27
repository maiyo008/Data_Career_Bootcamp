
def find_sum(arr):
    """
    Function to find the sum of elements in an array

    args:
        arr (ints): An array of integers
    
    Return: Sum of the array

    """
    sum = 0
    for elements in arr:
        sum = sum + elements
    
    return sum

if __name__ == "__main__":
    arr = [1,2,3,4]
    print(f'Sum of the array = {find_sum(arr)}')