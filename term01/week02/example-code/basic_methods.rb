def subtr(num1, num2)
    result = num1 - num2
    # puts result
    return result 
end 

res1 = subtr(9, 5)
puts res1
res2 = subtr(res1, 100)
puts res2

def print_welcome()
    puts_return_value = puts("Welcome back to class, hope lunch was tasty")
    return puts_return_value
end

result_print_welcome = print_welcome()
print(result_print_welcome.class)
puts

def variable(a, *b)
    print b 
    puts
end

variable(1, 6, 7, 5, 3)
