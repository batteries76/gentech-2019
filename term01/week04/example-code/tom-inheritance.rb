class Player
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

    def to_s
        "Player name: #{@player_name}, health: #{@health}, previous scores: #{@previous_scores}"
    end

    def pounce
        puts("POUNCE")
        update_health(-1)
    end
end

# NonPlayerCharacter is a Player. NonPlayerCharacter is a specialisation of Player
class NonPlayerCharacter < Player
    def initialize(player_name,npc_level)
        # first thing you must do is call constructor of parent
        super(player_name)
        @npc_level = npc_level
    end
    
    def get_npc_level
        @npc_level
    end
    
    def set_npc_level(npc_level)
        @npc_level = npc_level
    end

    def pounce()
        puts("POUNCE")
        super
    end

    def to_s
        super + "foo"
        "#{super.to_s} npc level: #{@npc_level}"
    end
end

player1 = Player.new("tom")
puts(player1)

npc1 = NonPlayerCharacter.new("computer", 1)
puts(npc1)
npc1.pounce()