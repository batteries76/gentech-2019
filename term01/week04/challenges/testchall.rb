## Planning negative and positive test cases.

# A **negative** test case is used to confirm that a method responds appropriately when given bad data.
# A **positive** test case is used to confirm that a method responds appropriately when given good data.

## Test cases challenge 1

# Consider the following method...

##
# Returns the result of addition on two given positive numbers.
# Returns 0 where one or both supplied arguments are 0 or less.
#
def add_two_positive_numbers(num1,num2)
    if (num1 < 0) 
        0
    elsif (num2 < 0) 
        0
    else 
        num1 + num2
    end
end
# 1. Plan, document and write three **negative** test cases for the add_two_positive_numbers method.
# 2. Plan, document and write one **positive** test case for the add_two_positive_numbers method.

## Test cases challenge 2

# Consider the following method...

##
# Checks the length of a username and returns true or false.
# Returns false where the length of the supplied string argument is less than 6 or greater than 12.
#
def validate_username_length(username)
    if(username.length == 0)
        return false
    elsif (username.length < 6)
        return false
    elsif (username.length > 12)
        return false
    else
        return true
    end
end
# 1. Plan, document and write three **negative** test cases for the validate_username_length method.
# 2. Plan, document and write two **positive** test cases for the validate_username_length method.