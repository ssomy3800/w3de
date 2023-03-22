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
        exp_ver2(base, power/2)

# p exp_ver1(2,4)
# p exp_ver1(3,3)
# p exp_ver1(5,0)
# p exp_ver1(15,1)

