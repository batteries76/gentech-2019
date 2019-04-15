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
    @@myki_card_numbers = []
    @@myki_cards = []
    attr_reader(:balance, :card_number)
    def initialize(balance)
        new_rand_instance = Random.new()
        @card_number = new_rand_instance.rand(100..999)
        @balance = balance
    end
    def self.make_myki_card(balance)
        flag = true
        while(flag)
            myki = Myki.new(balance)
            if !@@myki_card_numbers.include?(myki.card_number)
                flag = false
            end
        end
        @@myki_card_numbers << myki.card_number
        return myki 
    end
    def self.make_a_few
        while(@@myki_card_numbers.length != 9)
            @@myki_cards << Myki.make_myki_card(50)
        end
    end
    # def self.myki_card_numbers
    #     @@myki_card_numbers
    # end
    def self.myki_cards
        @@myki_cards
    end
end

class CommuterTerminal
    @@terminal_id_numbers = []
    @@terminals = []
    attr_reader(:logged_cards, :terminal_details, :id_number)
    def initialize(hash_input)
        new_rand_instance = Random.new()
        r_number = new_rand_instance.rand(10000..99999)
        @id_number = "t" + r_number.to_s
        if(hash_input[:type] == 'tram')
            cost = 2
        else
            cost = 4
        end
        @logged_cards = {}
        @terminal_details = {
            type: hash_input[:type],
            station_location: hash_input[:station_location],
            tram_num: hash_input[:tram_num],
            tram_route_num: hash_input[:tram_route_num],
            cost: cost
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

    def self.make_one_terminal(hash)
        flag = true
        while(flag)
            terminal = CommuterTerminal.new(hash)
            if !@@terminal_id_numbers.include?(terminal.id_number)
                flag = false
            end
        end
        @@terminal_id_numbers << terminal.id_number
        @@terminals << terminal
    end
    def self.make_a_few(terminal_details_arr)      
        terminal_details_arr.each do |terminal_details|
            CommuterTerminal.make_one_terminal(terminal_details)
        end
    end  
    def self.terminals()
        return @@terminals
    end 
end

terminal_details_arr = [
    {
        type: 'tram',
        tram_num: 3003,
        tram_route_num: 76
    },
    {
        type: 'tram',
        tram_num: 1666,
        tram_route_num: 5
    },
    {
        type: 'tram',
        tram_num: 4000,
        tram_route_num: 109
    },
    {
        type: 'tram',
        tram_num: 6002,
        tram_route_num: 42
    },
    {
        type: 'tram',
        tram_num: 8885,
        tram_route_num: 5
    },
    {
        type: 'train',
        station_location: 'Spencer St'
    },
    {
        type: 'train',
        station_location: 'Northcote'
    },
    {
        type: 'train',
        station_location: 'Denis'
    },
    {
        type: 'train',
        station_location: 'Flagstaff'
    },
    {
        type: 'train',
        station_location: 'North Richmond'
    }
]

Myki.make_a_few()

Myki.myki_cards.each do |card|
    print("#{card} has card number #{card.card_number}, and balance of #{card.balance}")
    puts
end

CommuterTerminal.make_a_few(terminal_details_arr)

# print(CommuterTerminal.terminals)
CommuterTerminal.terminals.each do |terminal|
    if(terminal.terminal_details[:type] == 'tram')
        print("#{terminal.id_number} is a #{terminal.terminal_details[:type]} terminal, tram number #{terminal.terminal_details[:tram_num]}, and route number of #{terminal.terminal_details[:tram_route_num]}. The cost at this terminal is #{terminal.terminal_details[:cost]}")
        puts
    else
        print("#{terminal.id_number} is a #{terminal.terminal_details[:type]} terminal, at location #{terminal.terminal_details[:station_location]}. The cost at this terminal is #{terminal.terminal_details[:cost]}")
        puts
    end
end 

# terminal1 = CommuterTerminal.new(train_term1_details)
# terminal2 = CommuterTerminal.new(tram_term1_details)

# puts(terminal1.terminal_details)
# puts(terminal2.terminal_details)

# puts(terminal1.sufficient_balance?(card1))
# puts(terminal1.sufficient_balance?(card2))
# puts(terminal1.sufficient_balance?(card3))

# terminal1.add_card_to_log(card1)
# terminal1.add_card_to_log(card2)

# puts(terminal1.logged_cards)

