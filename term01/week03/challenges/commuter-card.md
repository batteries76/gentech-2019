# Object Challs

# A Commuter Card (like a Myki card) has a  card number and balance. 
# Define this as a class. 
# The card number and balance should be initialized when calling the constructor. 
# Provide getters and setters for each instance attribute

# A Commuter_Terminal is responsible to scanning commuter cards. It provides a method which reads the balance of a given commute card, and returns true or false based on the card having a positive balance.
# Define this as a class.

# Instantiate three instances of Commute_Card.
# Instantiate one instance of Commute_Terminal.
# Scan each Commute_Card instance using the Commute_Terminal instance.
# Print the result.

# Part Two
# Modify the Commuter_Terminal class.
# All scanned cards must be stored in a log. Use a hash for this - where the key is the commute card number and the value is the commute card itself.
# Provide read access to the log.
# Print all entries in the log.

# Beast mode
# 1. Set a new attribute on your commuter terminal, and have it contain a hash which consists of the place the terminal is located, and the cost for passing the terminal (eg, tram and $4.50). Expand your program to account for this change. (edited) 
# 2. Include an attribute on the Myki that says whether the card is scanned on or off. Make sure that the card can only scan on when the status is _scanned off_, and so on. Then extend this so that it can only scan off using the same type of commuter terminal that it used to scan on.