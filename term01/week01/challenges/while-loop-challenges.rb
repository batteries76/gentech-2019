# 1
# Set a variable of num to 5 (integer)
# Then run this code.

while num == 5
    puts "hello world"
end 

# What's happening here? Why isn't the loop stopping? What kind of loop is this?

# 2
# Change the variable num to 4 (remember this mutates the value)
# Run the same code in question 1 again. What's happening?

# 3
# Now let's write our first working while loop. We need a counter and a way to increment the counter.
# Set a variable counter to equal 0
# Create a while loop with the condition of counter less than 5
# In the body of the while loop puts "Counter is currently #{counter}"
# After that we need to increment the counter somehow by 1. We have two options syntax wise to increment. What are they?
# If you are getting:
# "counter is currently 0"
# "counter is currently 1"
# "counter is currently 2"
# "counter is currently 3"
# "counter is currently 4"
# Your done!

# 4
# Change the while loop so that the final line thats printed is "counter is currently 9"

# 5
# When the counter is 3 I want there to be a different puts statement
# If the counter is 3 instead of "counter is currently 3" I want to print "special number 3!!!"

# 6
# Create an array of 5 food items (eg hamburger)
# Using a while loop iterate through the array and puts each item to screen

# 7
# Keep the same while loop from above with one new addition. When the iteration gets to your favourite food puts that "this is my favourite" but instead of "this" actually use string interpolation to specify the item.

# 8
# Create a counter variable and set it to 0
# Generate a random integer between 1 and 100
# Create an empty array with the variable name of bool
# Create a while loop that loops until the number is greater than what you randomly generated
# In the loop body if the counter is odd push false into the array if its even push true into the array
# puts the final bool array after the loop is done