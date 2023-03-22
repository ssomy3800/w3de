def range(front, back)
    return [] if back <= front
    [front] + range(front+1, back)
end

# p range(1, 5)
# p range(3, 7)
# p range(3, 3)
# p range(4, 3)

def exp_ver1(base, power) # assuming power >= 0
    return 1 if power == 0
    base * exp_ver1(base, power-1)
end

# p exp_ver1(2,4)
# p exp_ver1(3,3)
# p exp_ver1(5,0)
# p exp_ver1(15,1)

def exp_ver2(base, power)
    return 1 if power == 0
    return base if power == 1
    if power % 2 == 0
        exp_ver2(base, power/2) ** 2
    else
        base * (exp_ver2(base, (power - 1)/2) ** 2 )
    end
end

# p exp_ver2(2,4)
# p exp_ver2(3,3)
# p exp_ver2(5,0)
# p exp_ver2(15,1)

class Array
    def deep_dup
        new_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                # new_arr.concat(ele.deep_dup)
                # new_arr += [ele.deep_dup]
                new_arr << ele.deep_dup
            else
                # new_arr += [ele]
                new_arr << ele
            end
        end
        new_arr
    end
end

# array_1 = [1, [2], [3, [4]]]
# array_2 = array_1.deep_dup
# p array_1
# p array_2
# array_2[2] << 2
# p array_1
# p array_2

def rec_fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    previous_fib = rec_fib(n-1)
    previous_fib << previous_fib[-1] + previous_fib[-2]
end

# p rec_fib(0)
# p rec_fib(1)
# p rec_fib(2)
# p rec_fib(3)
# p rec_fib(4)
# p rec_fib(5)

def iter_fib(n)
    array = [0, 1]
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    i = 2
    while i < n
        array << array[-1] + array[-2]
        i += 1
    end
    array
end

# p iter_fib(0)
# p iter_fib(1)
# p iter_fib(2)
# p iter_fib(3)
# p iter_fib(4)
# p iter_fib(5)

def bsearch(arr, key)
    return nil if arr == []
    if arr[arr.length/2] == key
        return arr.length/2
    elsif arr[arr.length/2] > key
        first_half = bsearch(arr[0...arr.length/2], key)
       return  nil if first_half == nil
       return first_half
    else
        second_half = bsearch(arr[arr.length/2+1..-1], key)
        return nil if second_half == nil
        return arr.length/2 + 1  + second_half
    end
end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)
    merged = []
    while arr1.length != 0 && arr2.length != 0
        if arr1[0] < arr2[0]
            merged << arr1.shift
        else
            merged << arr2.shift
        end
    end
    if arr1.length == 0
        merged += arr2
    else
        merged += arr1
    end
    # puts merged
    merged

end

def merge_sort(arr)
    return [] if arr.length ==0
    return arr if arr.length == 1
    left = merge_sort(arr[0...arr.length/2])
    right = merge_sort(arr[arr.length/2..-1])
    merge(left,right)
end

# arr = [38,27,43,3,9,82,10]
# p merge_sort(arr)

def subsets(array)
    return [array] if array.length == 0
    key_value = array.pop

    sub = subsets(array)
    result = sub.map do |ele|
        ele += [key_value]
    end
    sub + result
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])

def permutations(array)
    return [array] if array.length == 1
    result = []
    array.each_with_index do |ele, i|
        sub = permutations(array[0...i] + array[i+1..-1])
        result += sub.map do |sub_element|
            [ele].concat(sub_element)
        end
    end
    result
end

# p permutations([1, 2, 3, 4])

def greedy_make_change(amount, coins)
    return [] if amount == 0
    all_coins = []
    coins.each do |coin|
        if amount - coin >= 0
            all_coins << coin
            all_coins += greedy_make_change(amount-coin, coins)
            break
        end
    end
    all_coins
end

p greedy_make_change(24, [10,7,1])
