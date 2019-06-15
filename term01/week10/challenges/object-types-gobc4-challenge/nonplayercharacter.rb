require_relative 'player'

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