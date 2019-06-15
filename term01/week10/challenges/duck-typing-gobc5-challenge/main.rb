
require_relative 'game'
require_relative 'gameactor'
require_relative 'gojira'
require_relative 'magiccarpet'
require_relative 'nonplayercharacter'
require_relative 'player'
require_relative 'wanderer'
require_relative 'cthulhu'

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

    # 2 x GameActor instances of type Cthulhu
    game_actor_7 = Cthulhu.new("Cthulhu 1", 5000)
    game_actor_8 = Cthulhu.new("Cthulhu 2", 7777)

    # Add all game actors to the game.
    game.add_game_actor(game_actor_1)
    game.add_game_actor(game_actor_2)
    game.add_game_actor(game_actor_3)
    game.add_game_actor(game_actor_4)
    game.add_game_actor(game_actor_5)
    game.add_game_actor(game_actor_6)
    game.add_game_actor(game_actor_7)
    game.add_game_actor(game_actor_8)
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
# Identifies all GameActor objects and executes their supported behaviours.
#
def check_game_actor_class_type(game_actors)
    game_actors.each do |ga|
        if ga.is_a? MagicCarpet
            puts "#{ga.get_name} is a #{ga.class.name} and is about to ..."
            puts "\t#{ga.take_off}, #{ga.cruise}, #{ga.land}"
        end
        if ga.is_a? Gojira
            puts "#{ga.get_name} is a #{ga.class.name} and is about to ..."
            puts "\t#{ga.stroll}, #{ga.powerwalk}, #{ga.blow_bubles}, #{ga.dive_deep}, #{ga.surface}"
        end
        if ga.is_a? Wanderer
            puts "#{ga.get_name} is a #{ga.class.name} and is about to ..."
            puts "\t#{ga.stroll}, #{ga.powerwalk}"
        end
        if ga.is_a? Cthulhu
            puts "#{ga.get_name} is a #{ga.class.name} and is about to ..."
            puts "\t#{ga.stroll}, #{ga.powerwalk}, #{ga.blow_bubles}, #{ga.dive_deep}, #{ga.surface}, #{ga.take_off}, #{ga.cruise}, #{ga.land}"
        end
    end
end

check_game_actor_class_type(game_actors)

##
# Duck-type the game_actors to discover who can .land.
# If it looks like a duck and sounds like a duck...
#
def make_flyers_land(game_actors)
    puts "\nChecking who can .land..."
    game_actors.each do |ga|
        puts "GameActor class: #{ga.class.name}, name: #{ga.get_name}"
        if ga.respond_to?(:land)
            ga.land
            puts("\t >>> #{ga.get_name} can land!")
        elsif
            puts "\t >>> .land not supported!"
        end
    end
end

make_flyers_land(game_actors)
