class Player
    # Class variable
    @@count = 0
    ##
    # Constructor.
    #
    def initialize(player_name)
        @player_name = player_name
        @health = 100
        @previous_scores = []
        # Increment class variable.
        @@count += 1
    end
    # Class method
    def self.get_instance_count
        @@count
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