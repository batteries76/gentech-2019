# Week 2, Day 2 — Methods
## Outcomes
Students can construct methods that set or get values, take parameters and return information via a method. Can complete a unit test on a method and understand the value of test driven development (TDD). Learn about style guides & naming method naming conventions.
## On successful completion of this unit students will be able to:
- write a ruby method
- discuss naming conventions
<!-- - write unit tests to test methods
- avoid writing a false test
- know about the unit test library
- know of recursion *
- difference between statements & expressions *
- good functional programming practices -->
## Guided instructions
- nil
- puts vs return
- Ruby basics document
- Ruby fundamentals path
- Refactoring code
<!-- - Run through morning challenge (student)
- Admin about Canvas, LMS
- Going back through (things we haven't covered)
- The amount of challenges
- How to cope/growth mindset
- The document I made re datatypes
- Run through the party parrot drinks challenge
- Kahoot -->
- Methods theory
    * Why?
    * Naming
    * Arguments
    * Return value
    * The difference between return and puts
<!-- - Methods challenges
- Git
- Ruby fundamentals path
- Free time (challenges, fundamentals, one-on-one) -->
### Methods
- Why methods are useful
- keyword ```def```
- writing a named method 
- arguments
- writing a method with and without parameters
- manipulate values of a parameter
- have method return information
<!-- - discuss getting and setting -->
<!-- - discuss functional programming
- discuss DRY principle (don't repeat yourself) -->
## Garret's Notes
Methods are a sequence of commands that can be reused together later within a program. Don’t let this scare you because we have already been using a method in our examples (```ruby puts```). Lets write a really simple method just to test out this concept. In Ruby to declare a method we must use the keywords ```ruby def``` and ```ruby end```.
```ruby
def say_different_greetings()
    puts “Hey there”
    puts “Hi friend”
    puts “Sup dude”
end
```
Ok lets run this code and……hmmm…..nothing happened. But I have a bunch of puts in my code so why didn’t I get anything printed to the CLI? That’s because we have defined the method we haven’t actually ran the code within it. If we want to run our method all we have to do is call it, which is just referencing it by name.
```ruby
def say_different_greetings()
    puts “Hey there”
    puts “Hi friend”
    puts “Sup dude”
end
say_different_greetings()
```
Awesome! We can call our method as many times as we want and it will run the code within it every time!
```ruby
def say_different_greetings()
    puts “Hey there”
    puts “Hi friend”
    puts “Sup dude”
end
say_different_greetings()
say_different_greetings()
say_different_greetings()
```
This is really great because we can reuse code we have written as many times as we would like. A big rule in programming for good code is to keep it DRY. DRY stands for Don’t Repeat Yourself, meaning if we have already written that particular code once we should be able to reuse it instead of writing it a second time.
Methods are awesome for keeping our code DRY but it gets even better! Methods are able to take any number of pieces of data as input. These pieces of input are referred to as our methods arguments. Arguments are awesome because it can modify the code within the method to do different things depending on the argument. Lets write another method that takes a single argument and prints it out to the screen with an exclamation point added.
```ruby
def say_it_excited(text)
    puts text + “!"
end
say_it_excited “Hey there”
say_it_excited “Let’s rock and roll"
```
Awesome! We were able to reuse the same code but get different results. Notice how the syntax changed slightly from when we defined a method without any arguments. We needed to add the parenthesis and then we put a word within them named text. Now we could have put any word we wanted between the parenthesis. Think of it as pre-defining a variable. We are saying, “Hey when we call this method we are going to receive an argument and when we receive that argument declare a variable named text and assign it the value of the argument". Then within the method we are able to use that variable.
What would happen if we tried to call this same method without any arguments.
```ruby
say_it_excited()
```
Error! Wrong number of arguments (given 0, expected 1) (ArgumentError). 
The Ruby translator is smart enough to know that this method needs 1 argument. The same thing would happen if we give the method to many arguments when we call it.
say_it_excited “Yes”, “No"
Once again we get an error letting us know we have given the method the wrong number of arguments. Also notice the syntax for passing in multiple arguments to a method. After each argument there is a comma if there is an additional argument. Lets define another method that takes two arguments and adds them together.
```ruby
def add(a, b)
    puts a + b
end
add(1, 2)
add(4, 10)
```
When we run our code we see the numbers 3 and 14 printed to the CLI! We can add in as many arguments to a method as we would like.
Have the class create their own method named subtract that takes three arguments and prints out to the CLI the result when all three are subtracted from each other.
```ruby
def subtract(a, b, c)
    puts a - b - c
end
```
Nice! Now that we are understanding better how methods work and how we can leverage them to make our code DRY, lets talk about one last concept around methods. Just like how our ternary operators were able to return a value methods can as well. In Ruby the last evaluated expression’s value is returned. Who cares right? Well that makes methods even more powerful because we can now access values that were evaluated within a method outside of it as well. It might make more sense with an example.
```ruby
def multiple(a, b)
    a * b
end
answer = multiple(3,2)
puts answer
```
The method multiple returned the value from a * b because it was the last expression evaluated. This allowed us to set that returned value as the value for the variable answer!
What will this method return?
```ruby
def division
    20 / 1
    20 / 2
    20 / 4
    20 / 5
end
answer = division
puts answer
```
The number 4! Thats because the last evaluated expression in our method was 20 / 4. But what if we wanted to return a value other than the last evaluated expression? We can use the return keyword! We us the return keyword whenever we want to exit and return a value from a method. Lets see what happens if we use it in our previous example.
What will this method return now?
```ruby
def division
    20 / 1
    return 20 / 2
    20 / 4
    20 / 5
end
answer = division
puts answer
```
The number 10! That is because we told the Ruby translator that there is no need to run any further code just stop here and return this value instead. It is important to note that once a method returns a value it will no longer run any other code within it. To prove my point here is another example.
```ruby
def song_lyrics()
    puts "Oops, I did it again"
    return puts "I played with your heart, got lost in the game"
    puts "Oh baby, baby"
end
song_lyrics()
```
What do you think will get printed to the screen?
We didn’t get the last lyric of the song printed to the CLI because the function returned on the second line so anything after that never runs.
## Challenges
## Resources
- [Naming conventions](https://en.wikipedia.org/wiki/Naming_convention_(programming))
- [Ruby Fundamentals Path](https://github.com/batteries76/ruby-fundamentals-path)
## Useful quotes
> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.
## Units
- Methods