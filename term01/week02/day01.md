# Week 2, Day 1 — Hashes 
## Outcomes
Students to know how to manipulate ruby hashes, how they can be used to represent real world objects and a comprehension of symbols and what they represent.
Students to know about datetime, date & time data type / object
## Review
- Datatypes (string, numbers, booleans)
- if/else
- Arrays
- Loops (while)
<!-- ## Extra
- Pseudocode
- Case statements? Ternary operators? -->
## On successful completion of this unit students will be able to:
- manipulate a hash
- setting values in a hash
- accessing values from a hash
- utilize a symbol either in a hash or variable
## Guided instructions
### Hashes & Symbols
- creating a hash
```ruby
# creating a hash
zoo = {
    name: 'Melbourne Zoo', # key - name; value - string ('Melbourne Zoo)
    number_of_animals: 3290, # key - number_of_animals; value - integer (3290)
    kids_welcome: true, # key - kids_welcome; value - boolean (true),
    animals: ['tapir', 'snake', 'butterfly', 'tiger'] # key - animals; value - array of strings
}
# Accessing the Hash
# How many animals?
zoo[:number_of_animals]
# Which animals 
zoo[:animals]
# One of those animals 
zoo[:animals][1] # => 'snake'
```
### Combine everything learnt
- combine arrays, strings, numbers, booleans, hashes, dates, loops and conditionals
### Example
```ruby
# We have seen how to make a hash, and how to access a hash, but what might be missing is a bit of the why. 
# Lets say that we are building up a database of tennis players, and we want to store some information about them in a useful structure.
# The first step could be to create a hash directly.
federer = {
    name: 'Roger Federer',
    majors: 20,
    retired: true,
    home_country: 'Switzerland'
}
# We might want to check that we have put these in correctly.
# Here we check that our 'name' key looks right
puts(federer[:name])
# Maybe we can also check that the 'retired' key is correct. I'll use another diagnostic puts:
puts(federer[:retired])
# We see from this output that this doesn't look right (not just yet anyway). So we want to reassign the value of the key 'retired' within the variable 'federer' to false.
federer[:retired] = false
# Let's make another hash. 
nadal = {
    name: 'Raphael Nadal',
    majors: 17,
    retired: false,
    home_country: 'Spain'
}
# we can check out what's inside doing this
print nadal 
puts # (To add in the newline after the print)
# ..and one more hash
agassi = {
    name: 'Andre Aggasi',
    majors: 8,
    retired: true,
    home_country: 'USA'
}
# Now we have three hashes that have the same format. We can see this by doing:
print federer
puts
print nadal 
puts 
print agassi
puts
# Because they are the same, we can put these structures into another data structure.
# For example, we might store them in an array:
player_arr = [federer, nadal, agassi]
# Now that we have an array, we have other tools at our disposal. 
# Let's simply print out each player's name:
player_arr.each do |player|
    puts(player[:name])
end
# Lets make another player, and then add them to the array:
djokovic = {
    name: 'Novak Djokovic',
    majors: 15,
    retired: false,
    home_country: 'Serbia'
}
player_arr << djokovic
# Let's check that by running the previous loop
player_arr.each do |player|
    puts(player[:name])
end
# All seems to be in order.
# Now we will up the complexity just a touch by adding in an if statement, and investigating our array further.
player_arr.each do |player|
    if(player[:retired])
        puts("#{player[:name]} has retired")
    else
        puts("#{player[:name]} still on the circuit")
    end
end
# We could also start getting overconfident about Nadal at the French Open and decide to push up his 'majors' value by one even before the start of the tournament. There are many ways to do this, but we are going to manually reach into the array and perform this action. We will just check we are reaching the right point first.
puts player_arr[1][:name]
puts player_arr[1][:majors]
player_arr[1][:majors] += 1
puts player_arr[1][:majors]
# Here we have drawn together many of the elements that we have touched on to this point.
```
<!-- ### Ruby Test
- on paper written test with Ruby questions -->
<!-- ### (optional) Early Introduction to methods
- see week 2 day 1
## DISCRETE MATHS — Sets
Go through a very basic set of numbers explaining uniqueness in a set - use whiteboard. Each element represented as ```∈```
```x = { 1, 2, 3, 4, 5 }``` -->
## Resources
- [Hash](https://ruby-doc.org/core-2.5.0/Hash.html)
- [Symbol](https://ruby-doc.org/core-2.5.0/Symbol.html)
- [Time](https://ruby-doc.org/stdlib-2.5.0/libdoc/date/rdoc/Time.html)
- [Date](https://ruby-doc.org/stdlib-2.5.0/libdoc/date/rdoc/Date.html)
- [DateTime](https://ruby-doc.org/stdlib-2.5.0/libdoc/date/rdoc/DateTime.html)
## Challenges
## Units
- Hashes
- Symbols