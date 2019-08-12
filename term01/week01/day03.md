# Week 1, Day 3 

## Arrays, if/else, loops

## Outcomes
Students have a basic understanding of arrays, ranges, truth statements, operators, switch statement, ternary operation (expressions) and loops
## Review
- Admin (signing the sheet, and what's coming up, overwhelm)
- Terminal
- Brew
- Rbenv
- Ruby
- Gems
- Variables
- Strings (look at docs and show more methods: upcase, etc)
- Numbers
- IO
- Changing datatypes
- Methods on numbers, methods on strings
## Today
- Booleans
- Comparison operators
- if, elsif, and else
- Pseudocode
- Arrays
- Loops (while and .each)
## Extra 
- DRY - eg of .to_i
- Hard coding
<!-- - Combining true and false
- Challenges and what to concentrate on -->
- String methods
- Number methods
- .push, .pop, .shift, .length
<!-- - Don't always need user input
- Someone up to present
- Pry is good for testing, mostly use a file for code
- !=
- coercion 
- .include? - talk about the '?' -->
## On successful completion of this unit students will be able to:
- create and manipulate an array
<!-- - have a basic understanding of ranges -->
- write an if statement with else
<!-- - write a case/switch statement
- write a ternary expression -->
- write while loops
<!-- - loop through an array -->
## Guided instructions
### Arrays
- create an array
- return element of an array
- push and element to an array
- pop an element off an array
- concatenate two arrays ```.concat```
- split a string into an array ```.split```
- join an array into a string ```.join```
- length of array ```.length```
- fetch an element of an array ```.fetch```
- element included in array ```.include?```
- insert element at index ```.insert```
- reverse elements ```.reverse```
- shuffle elements ```.shuffle```
<!-- # Ranges
- discuss ranges
- show doc page
Examples:
```ruby
(1..5).each {|num| puts "#{num}\n"}
case 79
    when 1..50   then   print "low\n"
    when 51..75  then   print "medium\n"
    when 76..100 then   print "high\n"
end
``` -->
### Booleans data type 
<!-- NOTE: good time to introduce truth tables at the end
- Talk about true and false -->
- code ```true```
- code ```false```
- equal to comparison operator ```==```
- not equal to comparison operator ```!=```
- greater than operator ```>```
- less than operator ```<```
- greater than or equal to ```>=```
- less than or equal to ```<=```
### Examples for if/else
- if have breakfast, then happy or not productive
- if raining then puts about umbrella
- if temperature is something then do something
- if option is this or that
### if/else statements (conditionals)
- write an if statement
- add an else to the if statement
- add an elsif to the if statement
<!-- ### Logical operators
Note: good to get into AND, OR, XOR discrete maths
- AND operator ```&&```
- OR operator ```||```
- NOT operator ```!``` -->
<!-- ### Case statement
- ruby switch statement with at least 3 cases & an else -->
<!-- ### Ternary expression
- write a ternary expression ```puts x ? 'is true' : 'is false'``` -->
### Loops
- discuss loops
- discuss infinite loops
- while loop ```while```
<!-- - do block ```do``` -->
<!-- ```ruby
say_hello { puts "hello world" } # do block passed to method
```
- begin while ```begin while```
- until loop ```until```
- for in loop ```for in```
- break out of loop ```break``` -->
<!-- ### Loop arrays
- learn about looping arrays the better way ```.each```
- each with index ```.each_with_index``` -->
## Resources
- [Array](https://ruby-doc.org/core-2.5.0/Array.html)
- [Range](https://ruby-doc.org/core-2.5.0/Range.html)
- [Control Expressions & loops](https://docs.ruby-lang.org/en/2.5.0/syntax/control_expressions_rdoc.html)
## Examples
- [Boolean and Logical Operator Test](https://github.com/GretchS/lesson-content/blob/master/test-questions/boolean-operators.rb)
<!-- ## DISCRETE MATHS — LOGIC
Truth tables (no binary truth table)
AND, OR, XOR (exclusive or) -->
## Challenges
## Basic control flow
### 1
Take this code and run it: 
```ruby
if true 
    puts "hello"
else
    puts "goodbye"
end 
```
- What does it puts to the screen? Why is this the case?
### 2
Now replace the ```if true``` with ```if false```
What does it puts to the screen now. Why?
### 3 
Create a variable that stores a pet type as a string
eg pet = "dog"
Create an if else that when pet == the_string_you_set 
In my case:
- if pet == "dog" 
- puts to the screen "I have a pet", else puts to the screen "I don't have a pet"
### 4
How can we refactor the code we just wrote?
Hint: we don't need the ==
### 5
Define a name variable with your own name as a string. 
If name is equal to your own name puts to the screen "Hi, my name is #{name}" else puts "that isn't my name!!!"
### 6
- Instead of setting the name variable as a hard coded string, I want you to get the name from the command line using gets
- Test out the difference between using gets.chomp and gets.strip (you need to use either chomp or strip everytime you invoke a gets) 
### 7
### elsif
You're at 120 spencer street.
Make 4 variables. level_8 is the string "reception", level_13 is the string "old coder room", level_12 is the string "classroom", location is also "classroom" 
- if level 8 is equal to location puts "im on level 8"  
- elsif level 13 is equal to location puts "im on level 13" 
- elsif level 12 is equal to location puts "im on level 12"
- else puts "im not at 120 spencer street"
### 8
How would we hit the else case in the above question?
### 9
Ask a user (yourself) how many coffees you drink in a day?  
Get the number of coffees you drink in a day as user input
- If you drink 0 (integer) coffees in a day puts to the screen "saving $$"
- If you drink 1 coffee in a day puts "a little but of caffeine doesn't hurt"
- If you drink 2 coffees in a day puts "i need my coffee hit"
- If you drink 3 coffees in a day puts "hmm it's getting a bit much"
- If you drink more than 3 coffees in a day puts "AHHHHH so much caffeine"
Hint: if the code is breaking think about data types.
### 10
Time
If the time is less than "12PM" puts morning, if time is after "12PM" but less than "1PM" puts lunch, if the time is after "1PM" puts afternoon, if the time is less than "9PM" but more than "7PM" puts "dinner time"
    
### 11  
Define a number variable with any integer
If the variable is odd puts "it's odd" if the variable is even puts "it's even"
There are two different ways to go about this, using a modulo operator and using ruby integer methods, answer the question using both of these approaches
### 12
Instead of hard coding the number variable use gets.strip
Again remember data types!
## Arrays
### 1
Make an array of 3 different colours
- example 
colours = ["red", "blue", "green"]
### 2
How do I access "blue" using an index
### 3
Store the string blue (which you accessed with an index) in a variable (also called blue, sorry for being confusing)
### 4
Create an array called four_letter_animals with the following animals (in this order):
* Calf
* Duck
* Elephant
* Goat
* Lamb
* Lion
* Mule
* Dog
- Add Puma to the end of the array
- Insert Joey after Goat and before Lamb
- Delete Dog
- Reverse the order of the array
- Replace Elephant with Foal
- Add Bear to the end of the array
- Reverse the order of the array again
### 5
Create an array with 10 animals you'd find at the zoo
### 6
Access the 3rd, 5th and last animal using indexes (remember indexs start at 0), store these strings in variables that match the string value
Optional: there is a ruby method that allows you to access the last position in an array, use that instead of a hard coded index number
### 7
Using the variable blue you stored in question 3 create a control flow structure whereby if your colour is blue puts "blue dub a dee dub a diii" else puts "some other colour"
### 8
How do we insert a new string value into our animals array? There are many ways to do this, use a method that you haven't already
### 9
Now we have a new animal in our animals array we want to discard (remove) the animal at the start of the array.
- How do we do this?
### 10
The zoo is cutting down on costs and needs to now remove the final 5 items in the animals array
- How do we do this?
### 11
The owner of the zoo won the lottery and can now add those same 5 animals back. 
- How do we do this ruby an array method rather than just hard coding a new animals array.
### 12
The zoo owner has now lost track of how many animal types are in their zoo. 
- Find out how many animals are in the array using a ruby array method.
### 13
The zoo owner wants to know if their zoo contains specifically "monkeys".
- Find out if the array contains monkeys (true or false) using a ruby array method.   
### 14
The zoo owner wants to have their animals sorted in alphabetical order because they're trying to be more organised.
- Achieve this using an array method
### 15
- Create a variable some_letters which is a range of letters from a to e using the ruby range syntax
- Create another variable alphabet which is a range of letters of the whole alphabet (from a to z).  
- Go to this link to see how this is done https://ruby-doc.org/core-2.6.1/Range.html (i always forget how ruby ranges work so i'll just by default go to the docs)
- If the some_letters array isn't equal in length to the alphabet's array in length puts 'some_letters is shorter in length than alphabet' 
### 16
Ask the user for three or more grocery items, store them in a list (array). It's OK to ask three times. Show the list to the user. Can’t remember how to use a specific ruby feature/syntax? That’s normal! Google + Ruby docs :)
- Try using the `.length` method to tell the user how many items are in their list.
- Sort the list alphabetically before showing it to the user
- Are you using gets.chomp multiple times? A 3.times loop might tidy your code.
- If the user tries to add 'Ice Cream', secretly replace it with 'Broccoli'
- Ask the user for quantities too. Show a nice looking list back to the user.
## Loops (while, .each)
### 1
- Set a variable of num to 5 (integer)
- Then run this code
```ruby
while num == 5
    puts "hello world"
end 
```
What's happening here? Why isn't the loop stopping? What kind of loop is this?
### 2
- Change the variable num to 4 (remember this mutates the value)
- Run the same code in question 1 again. What's happening?
### 3
Now let's write our first working while loop. We need a counter and a way to increment the counter.
- Set a variable counter to equal 0
- Create a while loop with the condition of counter less than 5
- In the body of the while loop puts "Counter is currently -{counter}"
- After that we need to increment the counter somehow by 1. We have two options syntax wise to increment. What are they?
- If you are getting:
- "counter is currently 0"
- "counter is currently 1"
- "counter is currently 2"
- "counter is currently 3"
- "counter is currently 4"
- Your done!
### 4
Change the while loop so that the final line thats printed is "counter is currently 9"
### 5
- When the counter is 3 I want there to be a different puts statement
- If the counter is 3 instead of "counter is currently 3" I want to print "special number 3!!!"
### 6
- Create an array of 5 food items (eg hamburger)
- Using a while loop iterate through the array and puts each item to screen
### 7
Keep the same while loop from above with one new addition. When the iteration gets to your favourite food puts that "this is my favourite" but instead of "this" actually use string interpolation to specify the item.
### 8
- Create a counter variable and set it to 0
- Generate a random integer between 1 and 100
- Create an empty array with the variable name of bool
- Create a while loop that loops until the number is greater than what you randomly generated
- In the loop body if the counter is odd push false into the array if its even push true into the array
### 9
Create an array variable named coding_langauges with 4 different languages in it
- Call .each on it and puts each specific langauge we're iterating through
### 10
Repeat question 6 and 7 from the while challenges, this time we won't need a counter

## Units
- Array
- Control Structures
- Methods
- Blocks
- Structure
- Ranges
- Maths Logic