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

wine = {

}

drinks_available = [water, beer, cocktail, wine]

# puts("1. #{beer[:drink_type]} costs $#{beer[:sell_price]}")

drinks_available.each do |drink_hash|
    puts("1. #{drink_hash[:drink_type]} is $#{drink_hash[:sell_price]}")
end


