# gobc_4

# This file contains the most recent version of GOBC which includes...
# Game
# Player
#  - NonPlayerCharacter
# GameActor
#  - Wanderer
#  - Gojira
#  - MagicCarpet

# Game maintains a collection of players and game actors.

# We have also implemented class variables and methods which manage the instance count of players and game actors.

# Note the following...

# In the previous version you were asked to call the .land behaviour on all GameActor instances in the game, and to observe this fail. This has been implemented in the try_to_make_all_flyers_land method, which is commented out further down. Why does it fail?

# Each class now resides within it's own .rb file and is 'required' by the statements at the top of this (main.rb) file.

# The check_game_actor_class_type method uses object's is_a? method to determine if the object's class is MagicCarpet (https://ruby-doc.org/core-2.5.1/Object.html#method-i-is_a-3F). This allows us to safely check the object's class before calling behaviours on it.

# In this edition we continue the epic...

# Cthulhu https://en.wikipedia.org/wiki/Cthulhu
# 1. Cthulhu is a game actor who can stroll, powerwalk, dive, blow bubbles, surface, take-off, cruise and land.
# 2. Define the Cthulhu class along with the behaviours mentioned. Implement these methods so that they simply return a string which echos the current behaviour name.
# 3. Create 2 Cthulhu instances and add them to the game.
# 4. Expand the check_game_actor_class_type method so that the stroll, powerwalk, blow bubbles, dive deep, surface, take-off, cruise and land behaviours are called only on game actors which support those behaviours.
# 5. Get the game actors from the game and pass them to both methods to the check_game_actor_class_type. Observe the results.

require_relative 'game'
require_relative 'gameactor'
require_relative 'gojira'
require_relative 'magiccarpet'
require_relative 'nonplayercharacter'
require_relative 'player'
require_relative 'wanderer'

##
# Print all players...
#
def print_all_players(print_title, players)
    puts
    puts(print_title)
    players.each do |player|
    puts("\t >> #{player}")
    end
    puts
end

##
# Print all game actors...
#
def print_all_game_actors(print_title, game_actors)
    puts
    puts(print_title)
    game_actors.each do |ga|
    puts("\t >> #{ga}")
    end
    puts
end

def init_game(game)
    # 3 x Player instance...
    player1 = Player.new("Straven")
    player2 = Player.new("kidd_thunda")
    player3 = Player.new("killer_emmy")

    # 3 x NPC instance...
    player4 = NonPlayerCharacter.new("Gizmo999",100)
    player5 = NonPlayerCharacter.new("sm4kd0wn",80)
    player6 = NonPlayerCharacter.new("1ns4nitee",90)

    # Add players to game...
    game.add_player(player1)
    game.add_player(player2)
    game.add_player(player3)
    game.add_player(player4)
    game.add_player(player5)
    game.add_player(player6)

    # 2 x GameActor instances...
    game_actor_1 = Wanderer.new("Wanderer 1",100)
    game_actor_2 = Wanderer.new("Wanderer 2", 200)

    # 2 x GameActor instances of type Gojira.
    game_actor_3 = Gojira.new("Gojira 1",100)
    game_actor_4 = Gojira.new("Gojira 2", 200)

    # 2 x GameActor instances of type MagicCarpet
    game_actor_5 = MagicCarpet.new("Magic Carpet 1", 40)
    game_actor_6 = MagicCarpet.new("Magic Carpet 2", 550)

    # Add all game actors to the game.
    game.add_game_actor(game_actor_1)
    game.add_game_actor(game_actor_2)
    game.add_game_actor(game_actor_3)
    game.add_game_actor(game_actor_4)
    game.add_game_actor(game_actor_5)
    game.add_game_actor(game_actor_6)
end

# Game instance...
game = Game.new

init_game(game)

# Get the game players...
game_players = game.get_players
print_all_players("printing the initialised player objects...", game_players)

# Get all game actors...
game_actors = game.get_game_actors
print_all_game_actors("printing the initialised game actor objects...", game_actors)

# Call the pounce behaviour of all players...
def make_all_players_bounce(game_players)
    game_players.each do |player|
        player.pounce
    end
end

make_all_players_bounce(game_players)

print_all_players("Printing to see the effect of pounce on the health attribute...", game_players)

p "Player instance count = " + Player.get_instance_count.to_s
p "GameActor instance count = " + GameActor.get_instance_count.to_s

## 
# Causes NoMethodError "undefined method `land'..." because not all GameActor's support .land.
#
# def try_to_make_all_flyers_land(game_actors)
#     game_actors.each do |ga|
#         ga.land
#     end
# end
#try_to_make_all_flyers_land(game_actors)

##
# Identifies all MagicCarpet GameActor objects and executes their .take_off, .cruise and .land behaviours.
#
def check_game_actor_class_type(game_actors)
    puts "\nChecking game actors..."
    game_actors.each do |ga|
        if ga.is_a? MagicCarpet
            puts "#{ga.get_name} is a #{ga.class.name} and is about to ..."
            puts "\t#{ga.take_off}, #{ga.cruise}, #{ga.land}"
        end
    end
end

check_game_actor_class_type(game_actors)

