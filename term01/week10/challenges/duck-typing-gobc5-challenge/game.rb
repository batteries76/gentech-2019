class Game
    ##
    # Constructor.
    #
    def initialize()
        @players = []
        @game_actors = []
    end
    def add_player(player)
        @players << player
    end
    def get_players
        @players
    end
    def add_game_actor(game_actor)
        @game_actors << game_actor
    end
    def get_game_actors()
        @game_actors
    end
end