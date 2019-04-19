# Vehicle things...
# 1. Vehicle has a make and model.
# 2. Heavy Vehicle is a Vehical and has a number of wheels.
# 3. Light Vehicle is a Vehicle and has a passenger capacity.
# 4. Super Heavy Vehicle is a Heavy Vehicle and has a maximum weight of 100 tonnes.

class Vehicle
    def initialize(make, model)
        @make = make
        @model = model
    end
    def get_make
        @make
    end
end

class HeavyVehicle < Vehicle
    def initialize(make, model)
        super(make, model)
    end
    @number_of_wheels
end

class LightVehicle < Vehicle
    def initialize(make, model, passenger_capacity)
        super(make, model)
        @passenger_capacity = passenger_capacity
    end
end

class SuperHeavyVehicle < HeavyVehicle
    # Class variable.
     @@max_weight = 100

    def initialize(make, model)
        super(make, model)
    end

    # Class method.
    def self.get_max_weight
        @@max_weight
    end

end

v1 = Vehicle.new("Mazda","6")
p v1
v2 = LightVehicle.new("Ford","Focus",4)
p v2
v3 = HeavyVehicle.new("Kenworth","T360")
p v3
v4 = SuperHeavyVehicle.new("Belaz","75710")
p v4
p SuperHeavyVehicle.get_max_weight


