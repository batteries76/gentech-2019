class Animal
    # attr_accessor :number_of_animals
    @@number_of_animals = 0
    def self.number_of_animals
        @@number_of_animals
    end
end

puts(Animal.number_of_animals)