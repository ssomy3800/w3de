# def range(front, back)
#     return [] if back <= front
#     [front] + range(front+1, back)
# end

# p range(1, 5)
# p range(3, 7)
# p range(3, 3)
# p range(4, 3)

# def exp_ver1(base, power) # assuming power >= 0
#     return 1 if power == 0
#     base * exp_ver1(base, power-1)
# end

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
