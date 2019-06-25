# ASCII Challenge

# All characters map to a decimal number. The first 128 characters can be seen in the ASCII table http://www.asciitable.com/

# Challenge 1. From decimal to character.
#  Ruby Integer has a method called chr which returns a string containing the character represented by an integer value https://ruby-doc.org/core-2.5.0/Integer.html#method-i-chr
# 1. Store the decimal mapping number for lowercase a (97).
# 2. Store the decimal mapping number for lowercase z (122).
# 3. Use a loop to traverse the decimal mapping numbers between a and z, using the Integer chr method to print all lowercase letters between a and z.

# Challenge 2. From character to decimal
# Let's reverse the process now - taking a character and producing the corresponding decimal mapping number.
# Ruby Integer has a method called ord which can return the character literal for a given number https://ruby-doc.org/core-2.5.0/Integer.html#method-i-ord
# 1. Store your name.
# 2. Use a loop to traverse each character in your name, accumulating the decimal mapping number into a total. For instance, "Rachael" equals 688!
# 3. Print the result.

# Challenge 3. Check if a character is a digit.
# Use your new ascii Kung Fu to write a method which returns the number of digits in a string.