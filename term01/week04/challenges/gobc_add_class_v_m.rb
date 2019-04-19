# Class variables and methods challenge.

# Player class...
# 1. Create a class variable which stores the number of player instances.
# 2. Increment the class variable each time an object is created (within initialize)
# 2. Create a class method which returns the number of player instances.
# 3. Call the class method to return the number of Player instances.
# 4. Repeat the previous steps for the GameActor class.

class Player
    ##
    # Constructor.
    #
    def initialize(player_name)
        @player_name = player_name
        @health = 100
        @previous_scores = []
    end
    def get_player_name
        @player_name
    end
    def set_player_name(player_name)
        @player_name = player_name
    end
    def get_health
        @health
    end
    def set_health(health)
        @health = health
    end
    def update_health(health_update_amount)
        @health += health_update_amount
    end
    def add_score(score)
        @scores << score
    end
    def get_scores
        @scores
    end
    ##
    # Override player.to_s
    #
    def to_s
        "Player: player_name = #{@player_name}, health =  #{@health}, previous_scores #{@previous_scores}"
    end
    def pounce
        p "PLAYER IS POUNCING"
        @health = @health - 1
    end
end

class NonPlayerCharacter < Player
    ##
    # Constructor.
    #
    def initialize(player_name, npc_level)
        # Call parent constructor and pass player_name.
        super(player_name)
        # Set specialised instance variable.
        @npc_level = npc_level
    end
    def get_npc_level
        @npc_level
    end
    def set_npc_level(npc_level)
        @npc_level = npc_level
    end
    ##
    # Override player.to_s
    #
    def to_s
        super + " npc_level = " + @npc_level.to_s
    end
    ##
    # Override player.pounce
    #
    def pounce
        p "NPC IS POUNCING"
        @health = @health - 5
    end
end

class Game
    ##
    # Constructor.
    #
    def initialize()
        @players = []
    end
    def add_player(player)
        @players << player
    end
    def get_players
        @players
    end
end

class GameActor
    def initialize(name, health_damage)
        @name = name
        @health_damage = health_damage
    end
    def get_name
        @name
    end
    def set_name(name)
        @name = name
    end
    def get_health_damage
        @health_damage
    end
    def set_health_damage(health_damage)
        @health_damage = health_damage
    end
    def to_s
        "GameActor: name = " + @name + " health_damage = " + health_damage.to_s
    end
end

class Wanderer < GameActor
    def stroll
        "STROLL"
    end
    def powerwalk
        "POWER WALK"
    end
end

##
# Just a lil method for printing...
def print_all_players(print_title, players)
    puts
    puts(print_title)
    players.each do |player|
    puts("\t >> #{player}")
    end
    puts
end

# Game instance...
game = Game.new

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

# Get the game players...
game_players = game.get_players

print_all_players("printing the initialised player objects...", game_players)

# Make them all pounce...
game_players.each do |player|
    player.pounce
end

print_all_players("Printing to see the effect of pounce on the health attribute...", game_players)

# 2 x GameActor instances...
game_actor_1 = Wanderer.new("Wanderer 1",100)
game_actor_2 = Wanderer.new("Wanderer 2", 200)

# Print attrubutes and call behaviours...
p game_actor_1
p game_actor_1.get_name
p game_actor_1.get_health_damage
p game_actor_1.stroll
p game_actor_1.powerwalk

p game_actor_2
p game_actor_2.get_name
p game_actor_2.get_health_damage
p game_actor_2.stroll
p game_actor_2.powerwalk


