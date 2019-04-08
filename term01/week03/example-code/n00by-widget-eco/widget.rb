class Widget
    # attr_<*> defines access to Instance attributes (not Class or Global vars).
    # Read and write access (getters and setters) to each of the following instance variables.
    attr_reader :id
    attr_accessor :name
    attr_accessor :description
    attr_accessor :lengthcms
    attr_accessor :widthcms
    attr_accessor :heightcms
    attr_accessor :weightgms
    attr_accessor :valueaud

    # Class variable.
    @@count_class_variable = 0

    # Constant.
    CONSTANT_GENERATION = 1.0

    # Private instance variable.
    @instance_random_seed = 99.9

    # Constructor.
    def initialize(id,
        name,
        description,
        lengthcms,
        widthcms,
        heightcms,
        weightgms,
        valueaud)

        # Set Private instance variables.
        @id = id
        @name = name
        @description = description
        @lengthcms = lengthcms
        @widthcms = widthcms
        @heightcms = heightcms
        @weightgms = weightgms
        @valueaud = valueaud

        # Increment Class variable counter.
        @@count_class_variable += 1
    end

    # Public class method provides access to read Class variable.
    def self.get_count
        @@count_class_variable
    end

    # Public instance method.
    def public_instance_method_ex_1
        instance_method_private
        "public_instance_method_ex_1"
    end

    # Private instance method.
    def private_instance_method
        puts("private_instance_method")
    end
    private :private_instance_method

    # Public class method.
    def Widget.public_class_method_1
        "Widget.public_class_method_1"
    end

    # Public class method - preferred as not coupled to class name.
    def self.public_class_method_2
        "self.public_class_method_2"
    end

    # Private class method.
    def self.private_class_method_1
        "self.private_class_method_1"
    end
    private_class_method :private_class_method_1

    # Object string rep.
    def to_s
        "id: #{id}, name: #{@name}, description: #{@description}, lengthcms: #{@lengthcms}, widthcms: #{widthcms}, heightcms: #{heightcms}, weightgms: #{weightgms}, valueaud #{valueaud.round(2)}"
    end

    # Object hash rep
    def to_hash
        hash = {}
        instance_variables.each { |var| 
            hash[var.to_s.delete("@")] = instance_variable_get(var) 
        }
        hash
    end

end

# SpecialisedWidget is-a Widget
class Specialised_Widget < Widget
    attr_accessor :specialised_attribute

    def initialize(id,
        name,
        description,
        lengthcms,
        widthcms,
        heightcms,
        weightgms,
        valueaud,
        specialised_attribute)

        # Pass args to parent.
        super(id,
            name,
            description,
            lengthcms,
            widthcms,
            heightcms,
            weightgms,
            valueaud)

        # Set specialised instance attribute.
        @specialised_attribute = specialised_attribute

        end

end
