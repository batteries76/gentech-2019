# Week 4, Day 3

## Lesson Material
- Git and GitHub (pushing to the cloud)
- Testing
- Test review
- Modules

### Git and GitHub
- We installed (tortuously) the SSH (secure shell) key on our GitHub accounts.
- We recovered the basic commands:
- `> git status` to check that we are not already in a git repository.
- `> git init` to initiate a repository in the fold we are in.
- `> git add .` to add all the files (if that's what we want) in the directory to staging.
- `> git commit -m "thoughful message"` to commit and create a coding breakpoint.
- `> git add remote origin https://github.com/user/repo.git` which connects it to our remote, also now know as the _origin_.
- `> git push origin master` which is us pushing from our local's master branch (we will discuss this later), meaning from our computer, to the origin, our cloud repository. Yes, it is confusing. You get used to it.

### Testing
- We discussed TTD a little.
- We talked through _edge cases_ (testing the extreme or boundary cases for a method) 
- ..and then _unit testing_ where we test our methods.
- This process will be helped and automated by a test runner in the future, but we saw an example of how we might work through the problem ourselves.
```ruby
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
        puts("test_inputs_div (a) passed")
    else 
        puts("test_inputs_div (a) FAILED")
    end
    # test (b)
    result = div(5.0, 8)
    if(result == "happy")
        puts("test_inputs_div (b) passed")
    else 
        puts("test_inputs_div (b) FAILED")
    end
    # test (c)
    result = div("str", 8)
    if(result == "The first argument was not a valid input")
        puts("test_inputs_div (c) passed")
    else 
        puts("test_inputs_div (c) FAILED")
    end
end

test_input_div()
```