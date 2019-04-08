# Bill Calculator!

# Use your Ruby Kung-fu on this tasty challenge which will have you looping through an array of hashes!

# A group of friends have just finished lunch. Write a method to work out how much each person owes.

# - Your app should ask "Enter a customer's name"- Your first line of code is:
items = [
    {
        customer: "John",
        item: "Soup",
        cost: 8.50
    },
    {
        customer: "Sarah",
        item: "Pasta",
        cost: 12
    },
    {
        customer: "John",
        item: "Coke",
        cost: 2.50
    }
]

# - Your app should output, for example: "John owes $11.0"

running = true
while(running)
    print "Please enter a command: "
    choice = gets().strip()
    puts choice

    if choice == '1'
        # Add new item
        print "Enter customer name: "
        customer = gets().strip().capitalize()
        print "Their order: "
        item = gets().strip().capitalize()
        print "Cost: "
        cost = gets().strip().to_f()

        order = {
            customer: customer,
            item: item,
            cost: cost
        }
        items << order
        print items

    elsif choice == '2'
        # Calculate total
        print "Enter a customer's name: "
        name = gets().strip().capitalize()

        customer_total = 0
        items.each do |order|
            if order[:customer].downcase() == name.downcase()
                customer_total += order[:cost]
            end
        end

        if customer_total == 0
            puts "'#{name}' is not in the system"

        else
            balance = sprintf('%.2f', customer_total)
            puts "#{name} owes $#{balance}"
        end

    elsif choice == 'h'
        # Help
        puts """Command list:
1. Add order
2. Collect customer total
h. This help list
x. Exit        
"""
    
    elsif choice == 'x'
        # Quit
        running = false
        puts "Thank you for choosing Denny's"
    
    else
        puts "Invalid input"
    end

end

## Beast
# Format your total so it always shows two decimal places, e.g. $11.00
# Allow items to be added to the list. E.g. "Press 1 to add items, press 2 to work out a total".