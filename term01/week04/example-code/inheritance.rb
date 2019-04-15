
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
        @health
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
end