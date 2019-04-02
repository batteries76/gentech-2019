def check_wallet(current_balance, item_price)
    if(current_balance >= item_price)
        return true
    else
        return false
    end
end 

balance = 600
item1 = 200
item2 = 800
item3 = 600

puts check_wallet(balance, item1) # check_wallet(600, 200)
puts check_wallet(balance, item2) # check_wallet(600, 800)
puts check_wallet(balance, item3) # check_wallet(600, 600)

def adder(num1, num2)
    # result = num1 + num2
    return num1 + num2
end

puts(adder(9, 4))
puts(adder(9, 99))
puts(adder(9, 400))

# With method
def say_hi(name, day)
    greeting = "hi #{name}, welcome to #{day}!!"
    puts greeting
   end
   ​
   say_hi('Matt', 'Tuesday')
   say_hi('Simon', 'Monday')
   say_hi('Rach', 'Wednesday')
   ​
   # Without method
   name = 'Matt'
   day = 'Tuesday'
   puts "hi #{name}, welcome to #{day}!!"
   ​
   name = 'Simon'
   day = 'Monday'
   puts "hi #{name}, welcome to #{day}!!"
   ​
   name = 'Rach'
   day = 'Wednesday'
   puts "hi #{name}, welcome to #{day}!!"
