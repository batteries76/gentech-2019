puts "You have 1000 pieces of gold."
puts "1. A magical staff costs 500 piece of gold."
puts "2. A spell costs 25 pieces of gold."
puts "3. A word from a wise owl costs 125 pieces of gold"
puts
puts "Please put the sequence number of the item you would like to buy. For example, you if you enter 2,
you can have a spell and 25 piece of gold will be duducted from your pocket."

puts
# initial_gold_bal = 1000
user_choice = gets().strip().to_i()
count_staff = 0
count_spell = 0
count_wiseowl = 0
puts "Your choice is #{user_choice}."
staff_price = 500
spell_price = 25
wise_owl_price = 125

balance = 1000
while (balance > 0)
  if(user_choice == 1)
    if(balance >= staff_price)
        balance = balance - staff_price
        puts "OK, you buy a magical staff that costs 500, and your remaining balance is #{balance}."
        count_staff = count_staff + 1 
    else
        puts("Not enough money remaining. You only have #{balance} left to spend")
    end
  elsif(user_choice == 2)
    balance = balance - 25
    puts "OK, you buy a spell that costs 25, and your remaining balance is #{balance}."
    count_spell = count_spell + 1
  elsif(user_choice == 3)
    balance = balance - 125
    puts "Expecto patronum!"
    puts "Your remaining balance is #{balance}."
    count_wiseowl = count_wiseowl + 1
  else
    puts "Invalid choice, and please make another choice"
  end


 puts "You still have some money, please buy more stuff. Again, key in 1, 2 or 3"
   user_choice = gets().strip().to_i
end

input_exit = "No"
while (input_exit == "No")
  puts "Now you have negative balance. Do you want to exit the program? Please input Yes or No."
  input_exit = gets().strip()
end

puts "You have buy #{count_staff} staff."
puts "You have buy #{count_spell} spells"
puts "You have buy #{count_wiseowl} wise owls."

def check_wallet(current_balance, item_price)
    if(current_balance > item_price)
        return true
    else
        return false
    end
end 