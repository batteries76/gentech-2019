# 1

# Basic control flow

# Take this code and run it

if true 
    puts "hello"
else
    puts "goodbye"
end 

# What does it puts to the screen? Why is this the case?

# 2

# Now replace the if true with if false

# What does it puts to the screen now. Why?

# 3 

# Create a variable that stores a pet type as a string

# eg pet = "dog"

# Create an if else that when pet == the_string_you_set 

# In my case:

if pet == "dog" 
    
# puts to the screen "I have a pet", else puts to the screen "I don't have a pet"

# 4

# How can we refactor the code we just wrote?

# Hint: we don't need the ==

# 5

# Define a name variable with your own name as a string. 

# If name is equal to your own name puts to the screen "Hi, my name is #{name}" else puts "that isn't my name!!!"

# 6

# Instead of setting the name variable as a hard coded string, I want you to get the name from the command line using gets

# Test out the difference between using gets.chomp and gets.strip (you need to use either chomp or strip everytime you invoke a gets) 

# 7

# elsif

# You're at 120 spencer street.

# Make 4 variables. level_8 is the string "reception", level_13 is the string "old coder room", level_12 is the string "classroom", location is also "classroom" 

# if level 8 is equal to location puts "im on level 8"  

# elsif level 13 is equal to location puts "im on level 13" 

# elsif level 12 is equal to location puts "im on level 12"

# else puts "im not at 120 spencer street"

# 8

# How would we hit the else case in the above question?

# 9

# Ask a user (yourself) how many coffees you drink in a day?
	
# Get the number of coffees you drink in a day as user input

# if you drink 0 (integer) coffees in a day puts to the screen "saving $$"

# if you drink 1 coffee in a day puts "a little but of caffeine doesn't hurt"

# if you drink 2 coffees in a day puts "i need my coffee hit"

# if you drink 3 coffees in a day puts "hmm it's getting a bit much"

# if you drink more than 3 coffees in a day puts "AHHHHH so much caffeine"

# Hint: if the code is breaking think about data types.

# 10

# Time

# If the time is less than "12PM" puts morning, if time is after "12PM" but less than "1PM" puts lunch, if the time is after "1PM" puts afternoon, if the time is less than "9PM" but more than "7PM" puts "dinner time"
	
# 11
	
# Define a number variable with any integer
	
# If the variable is odd puts "its odd" if the variable is even puts "its even"
	
# There are two different ways to go about this, using a modulo operator and using ruby integer methods, answer the question using both of these approaches

# 12
	
# Instead of hard coding the number variable use gets.strip
	
# Again remember data types!!