class GameActor
    @@count = 0
    def initialize(name, health_damage)
        @name = name
        @health_damage = health_damage
        @@count += 1
    end
    def self.get_instance_count
        @@count
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
        "GameActor: name = " + @name + " health_damage = " + @health_damage.to_s
    end
end