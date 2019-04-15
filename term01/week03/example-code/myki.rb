# Myki Challenge (Objects and Classes)

# A Commuter Card (like a Myki card) has a  card number and balance. 
# Define this as a class. 
# The card number and balance should be initialized when calling the constructor. 
# Provide getters and setters for each instance attribute

# A CommuterTerminal is responsible to scanning commuter cards. It provides a method which reads the balance of a given commuter card, and returns true or false based on the card having a positive balance.
# Define this as a class.

# Instantiate three instances of CommuteCard.
# Instantiate one instance of CommuteTerminal.
# Scan each CommuteCard instance using the Commute_Terminal instance.
# Print the result.

# Part Two
# Modify the CommuterTerminal class.
# All scanned cards must be stored in a log. Use a hash for this - where the key is the card's card number and the value is the commute card itself.
# Provide read access to the log.
# Print all entries in the log.

# Beast mode
# 1. Set a new attribute on your commuter terminal, and have it contain a hash which consists of the place the terminal is located, and the cost for passing the terminal (eg, tram and $4.50). Expand your program to account for this change. (edited) 

# 2. Include an attribute on the Myki that says whether the card is scanned on or off. Make sure that the card can only scan on when the status is _scanned off_, and so on. Then extend this so that it can only scan off using the same type of commuter terminal that it used to scan on.

require 'pry'

class Myki 
    attr_reader(:balance, :card_number)
    def initialize(balance)
        new_rand_instance = Random.new()
        @card_number = new_rand_instance.rand(1..9)
        @balance = balance
    end
end

class CommuterTerminal
    attr_reader(:logged_cards, :terminal_details)
    def initialize(hash_input)
        @logged_cards = {}
        @terminal_details = {
            type: hash_input[:type],
            station_location: hash_input[:station_location],
            tram_num: hash_input[:tram_num],
            tram_route_num: hash_input[:tram_route_num]
        }
    end
    def sufficient_balance?(card)
        if(card.balance > 0)
            return true
        else  
            return false
        end
    end
    def add_card_to_log(card)
        card_num_str = card.card_number.to_s
        hash_key = ("c" + card_num_str).to_sym
        @logged_cards[hash_key] = card 
    end
    def print_all_logged_cards(hash)

    end
end

myki_card_numbers = []
myki_cards = []

def make_myki_card(arr, balance)
    flag = true
    while(flag)
        myki = Myki.new(balance)
        if !arr.include?(myki.card_number)
            flag = false
        end
    end
    arr << myki.card_number
    return myki 
end

while(myki_card_numbers.length != 9)
    myki_cards << make_myki_card(myki_card_numbers, 50)
end

myki_cards.each do |card|
    print("#{card} has card number #{card.card_number}, and balance of #{card.balance}")
    puts
end
# card1 = Myki.new(50)
# card2 = Myki.new(-3)
# card3 = Myki.new(70)
# puts(card1.card_number)
# puts(card2.card_number)
# puts(card3.card_number)

train_term1_details = {
    type: 'train',
    station_location: 'Spencer St'
}
tram_term1_details = {
    type: 'tram',
    tram_num: 7690,
    tram_route_num: 3
}

terminal1 = CommuterTerminal.new(train_term1_details)
terminal2 = CommuterTerminal.new(tram_term1_details)

# puts(terminal1.terminal_details)
# puts(terminal2.terminal_details)

# puts(terminal1.sufficient_balance?(card1))
# puts(terminal1.sufficient_balance?(card2))
# puts(terminal1.sufficient_balance?(card3))

# terminal1.add_card_to_log(card1)
# terminal1.add_card_to_log(card2)

# puts(terminal1.logged_cards)

