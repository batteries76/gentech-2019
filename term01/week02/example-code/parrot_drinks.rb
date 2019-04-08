# you are working at a bar where you have a current backlog of drinks to make:
# 3 party parrot cocktails
# 2 party parrot waters
# and
# 6 party parrot beers
# write a program that asks the customer for their order.
# if they order a party parrot cocktail, add one to the number of party parrot cocktails you need to make,
# if they order a party parrot water, add one to the number of party parrot waters you need to make,
# if they order a party parrot beer, add one to the number of party parrot beers you need to pour
# print the final drinks order so you know what to make
# ****
# cocktails sell for $22, and cost $8 to make
# beer sell for $12, and cost $3 to pour
# water sell for $6, and cost $0.15 to make
# print out the total profit for the orders you have
######
# 1. Use a loop to rewrite problem above to repeatedly take orders for drinks. Start all the drink numbers at 0, and when they reach 10 drinks in total, inform the user that it's time to go home. 
# 2. Add to your program a question regarding how much money the user has. When they have blown their budget, inform the user and tell them to head home.

cocktail = {
    drink_type: 'cocktail',
    on_order: 3,
    sell_price: 22,
    cost_to_make: 8
}

water = {
    drink_type: 'water',
    on_order: 2,
    sell_price: 6,
    cost_to_make: 0.15
}

beer = {
    drink_type: 'beer',
    on_order: 6,
    sell_price: 12,
    cost_to_make: 3
}

customer_order1 = {
    drinks_purchased: 0,
    drink_list: [],
    budget: 0
}

drinks_available = [water, beer, cocktail]

customer_order2 = {
    drinks_purchased: 0,
    drink_list: [],
    budget: 600
}

def print_menu()
    puts("""
        What would you like to order?
        1. Cocktail
        2. Beer
        3. Water
        x. Exit
        """)
end

def deal_with_choice(drink, customer)
    puts("You are buying a #{drink[:drink_type]}.")
    drink[:on_order] += 1
    customer[:drinks_purchased] += 1
    customer[:drink_list] << drink
    # puts(customer)
    return customer
end

print_menu()
user_choice = gets().strip()

while(true)
    print_menu()
    if(user_choice == "1")
        customer_order1 = deal_with_choice(cocktail, customer_order1)
        # puts("after deal_with_choice")
        # print(customer_order1)
        # puts
    elsif(user_choice == "2")
        customer_order1 = deal_with_choice(beer, customer_order1)
    elsif(user_choice == "3")
        customer_order1 = deal_with_choice(water, customer_order1)
    elsif(user_choice == "x")
        break
    else 
        puts("Please enter a useful input.")
    end
    user_choice = gets().strip()
end
print(customer_order1)
puts
cust1_cocktails = 0
customer_order1[:drink_list].each do |drink|
    if(drink[:drink_type] == 'cocktail')
        cust1_cocktails += 1
    end
end
puts cust1_cocktails

puts("EOF")