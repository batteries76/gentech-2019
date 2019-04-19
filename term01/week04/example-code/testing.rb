# I want this method to:
# Always return the floating point result of the numbers given
# Warn the user that they are trying to div by 0
# Check that the inputs are both numbers
def div(num1, num2)
    if(num1.is_a?(Integer) || num1.is_a?(Float))
        return "happy"
    end
    # if(!num2.is_a?(Integer) || !num2.is_a?(Float))
    #     return "The second argument was not a valid input"
    # end
    return "The first argument was not a valid input"
end

def test_inputs_div()
    # test (a)
    result = div(5, 8)
    if(result == "happy")
        puts("test_1_div (a) passed")
    else 
        puts("test_1_div (a) FAILED")
    end
    # test (b)
    result = div(5.0, 8)
    if(result == "happy")
        puts("test_1_div (b) passed")
    else 
        puts("test_1_div (b) FAILED")
    end
    # test (c)
    result = div("str", 8)
    if(result == "The first argument was not a valid input")
        puts("test_1_div (c) passed")
    else 
        puts("test_1_div (c) FAILED")
    end
end

test_input_div()
        
