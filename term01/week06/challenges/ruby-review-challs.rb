# Ruby review challenges.

# Note: Make sure you look at all questions.

# **Core:**

# **1.** Print out how old you are in seconds

# **2.** Create a method called highest_number that takes in two numbers and returns the higher of the two

# **3.** Create a method that takes a number as input and returns "This is a prime number", if its a prime number, else, "This is not a prime number"

# **4.** Prompt the user to enter their name. If its longer than 7 letters, return "By golly, thats a long name!", otherwise return, "Hi there new friend"

# **5.** Create a method that takes a string, and returns the amount of vowels in that string. *E.g* If the string "How many vowels" is passed through, the method will return "There are 4 vowels in this word"

# **6.** Create a method that will take a 24hr timestamp as an integer (e.g. 9AM will be 0900, 3:35PM will be 1535) and, using conditional logic, if its:

# ```
# * before 12noon - return its morning
# * between 12noon and 1PM - return its lunchtime
# * between 1PM and 5PM - return arvo blues
# * between 5PM and 6PM - return happy hour
# * between 6PM and 8PM - return dinner time
# * between 8PM to Midnight - return bedtime
# * past midnight (i.e. 2400 or over) - return thats not a valid 24hr time
# ```

# *Try this with both if/elsif/else and case statements!*

# **7.** Create a hash of what you ate yesterday (i.e. {breakfast: "oats", lunch: "curry" ... }). Loop through this hash, and print out what you ate yesterday!

# **8.** Create a block that will print out all even numbers between 1 and 20

# **9.** Create a method that will greet a user dynamically, based on time. It will first ask for their name, then, if its before noon, it will say "Good morning, < name >!", otherwise it will say "Good afternoon, < name >!"

# **10.** Create a method that will take in a non-negative integer, and will return the highest possible number
# * *E.g.* If the input was 4847291, it will return 9874421

# **11.** Create a method that will take a multi-word string as input, and returns that same string, with each word capitalized. 
# * *E.g.* If the input was "tHIs IS a MuLTi wORd STiNG", should return "This Is A Multi Word String"

# **12.** Write a method that will take a string of space seperated numbers as input, and return the highest and lowest number from this string.
# * *E.g.* If the input was "5 2 9 8 23 1", it should return "23 1"

# **13.** Create a method, which takes an argument and returns an array of items, without any elements with the same value next to each other that also preserves the original order of the elements.

# ```
# *E.g. If the input was "AAaAbbCCCcDDcDA", it should return ["A","a","A","b","C","c","D","c","D","c","D","A"]
# *E.g. If the input was [2,2,2,5,5,2,5,6,1,1,1,1], it should return [2,5,2,5,6,1]
# ```


# **14.** Create a method that prompts the user for a numerical input. Take this number, and create an array of that length, filled with random numbers between 1 and 100

# ```
# *E.g. If the user enters 4 -> [23,2,65,43]
# ```

# **ADVANCED**
# * After the array has been created, prompt the user to guess a number between 1 and 100, and return true if that number is in the array, or false if not

# **EXPERT** 
# * See if you can implement an additional method (or a while loop) that will ensure the user is actually entering a number

# **15.** We are all familiar with likes. Someone posts a photo or makes a post. When the post is first released:

# ```
# * If no one likes it, it says a sad 'no one likes this' underneath it
# * If one person likes it - it says '#{name} likes this'
# * If two people like it - it says '#{name} and #{name} like this'
# * If 3 people like it - it says '#{name}, #{name} and #{name} like this'
# * If 4 or more people like it - it says '#{name}, #{name} and #{num} others like this', where the two names are the most recent in the array, and the num is the remaining amount of people
# ```

# Create a method that will take an array of people's names, and will return who has liked the post. Make sure you get the grammar correct!:

# ```
# *E.g. facebook_likes(["Alex"]) should return "Alex likes this"
# *E.g. facebook_likes(["Alex", "Garret", "Paul", "Aleisha", "Sarah"]) should return "Alex, Garret and 3 others like this"
# ```

# **16.** Write a method that will take a string as an input. The method will check this string, and count the amount of 'x's and 'o's. It should return true if the amount of 'x's and 'o's are the same, and should return false if they are different. It should also be case insensitive.

# ```
# E.g. exes_and_ohs("ooxx") should return true
# E.g. exes_and_ohs("oOxXxoX") should return false
# E.g. exes_and_ohs("zpzpzpp") should return true
# ```


# **17.** Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the
# number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz. This is a classic interview-style question, where there are multiple ways to solve it. See how you go!

# **18.** Use a method (or class if you're feeling like a bit of an expert), to create a scissors-paper-rock (SPR) game. The method (or class) will prompt the user for their selection ("scissors", "paper", "rock"), then will randomly select the computers choice, and will print out the result based on the rules of SPR. 

# ```
# *E.g. User selects "scissors", random computer selection spits out "rock", print "Computer wins with rock!"
# ```

# After the game, ask the user if they would like to play again. If they select "No" or "N", exit the method (or class), else replay the method (or class) using recursion. 

# **Expert**
# * Ensure the user is entering their choice correctly

# **19.** Create a method that will generate a number between 1 and 100, then will prompt the user to guess that number. Let them know whether they have guessed correctly or incorrectly.

# **Advanced** 
# * Turn this into a loop, that will break out with a success message if the guess was correct, otherwise it will continue to ask the user for input until they get it right

# **Expert**
# * There is an algorithm that ensures this number can be guessed in 7 guesses. Alter the method, so the user is only allowed 5 guesses. Let them know how many guesses they have left!

# **Absolute Expert**
# * Ensure the user is entering a number. If they are not, do not include it as a guess, but prompt them to enter a number again

# **20.** Create a calculator class. This class will take 4 methods:

# ```
# * add
# * subtract
# * divide
# * multiply
# ```

# Each method will do exactly as it sounds, they will take two numbers, and perform the relevant calculation:

# ```
# E.g.
# casio = Calculator.new
# casio.add 5, 6 #Should return 13
# casio.multiply 5, 6 #Should return 30
# ```

# **Advanced**
# * See if you can alter the methods to take any number of arguments (google 'ruby splat args'), and still perform these methods

# **Expert**
# * Negative numbers and zeros do not cause an issue with multiply, subtract or add, but they can throw a spanner in the works with divide. See if you can alter the divide method, so that it will not throw an error when trying to divide by a negative or zero, instead, just display a message letting the user know

# *Once you've finished EVERYTHING...*

# **EXPERT**
# * Write some tests for these challenges. If you feel confident with them, share them with your fellow dev-mates

# 21. How would you re-write this using a ternary operator?
# x = 10
# y = 11
# if x > 10
#     puts "True"
# else
#     puts "False"
# end

# 22. How would you re-write this using a ternary operator?
# balance = 555
# withdrawal_request = 556
# if withdrawal_request > balance
#     puts "Insufficient funds!"
# else
#     puts "Transaction successful!"
# end

# 23. How would you re-write this using a ternary operator?
# score = 99999
# highest_score = 10000
# if score < highest_score
#     puts "You do not have the highest score!"
# else
#     puts "You have the highest score!"
# end

# 24. Install the colorize gem and print "I LOVE PINK" in the color pink.

# 25. Using the colorize gem print "I LOVE BLUE" in the color blue.

# 26. Using the colorize gem print "I LOVE RED" in the color red.