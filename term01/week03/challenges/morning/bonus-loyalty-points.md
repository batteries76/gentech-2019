## Methods, hashes and arrays.

# It's bonus time! All users will get a 5 point loyalty points bonus today! BUT If the user has transactions totalling greater than $20.00 they will get a 20 point bonus instead!

# Here's a hash...
```
user_hash = {
    user_id: "uid000984", 
    transactions: [5.50,4.99,3],
    loyalty_points: 505
}
```
# Notice that it contains 3 key/pairs which includes an array.

# 1. Write a method called calculate_total which takes an array of numbers, adds all of the numbers together and then returns the total.

# 2. Write a method called apply_bonus which takes the user's hash. It then obtains the user's transaction total from the calculate_total method. It then determines which bonus to apply to the user's loyalty points and applies the bonus. 

# 3. Call the apply_bonus method and then print the result.