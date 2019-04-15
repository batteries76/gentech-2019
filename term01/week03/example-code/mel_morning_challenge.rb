# Methods, hashes and arrays.
# It's bonus time! All users will get a 5 point loyalty points bonus today! BUT If the user has transactions totalling greater than $20.00 they will get a 20 point bonus instead!
# Here's a hash...
user_hash = {
    user_id: "uid000984", 
    transactions: [5.50,4.99,3],
    loyalty_points: 505
}
# Notice that it contains 3 key/pairs which includes an array.
# 1. Write a method called calculate_total which takes an array of numbers, adds all of the numbers together and then returns the total.
def calculate_total(transactions)
    total = 0
    transactions.each do |num|
        total += num
    end
 return total
end
user_total = calculate_total(user_hash[:transactions])
puts(user_total)
# 2. Write a method called apply_bonus which takes the user's hash. It then obtains the user's transaction total from the calculate_total method. It then determines which bonus to apply to the user's loyalty points and applies the bonus. 
def apply_bonus(user_total, loyalty_points)
    if (user_total > 20)
        loyalty_points += 20
    else
        loyalty_points += 5
    end
    return loyalty_points
end
result2 = apply_bonus(user_total, user_hash[:loyalty_points])
puts(result2)

# 3. Call the apply_bonus method and then print the result.
puts("User #{user_hash[:user_id]}, has spent $#{user_total}, loyalty points total was: #{user_hash[:loyalty_points]} now: #{result2}.")