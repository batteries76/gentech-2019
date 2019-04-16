# Week 3, Day 3

## Object Oriented Programming (OOP)

### Lesson Material

### Classes & Objects Review

What does OOP stand for?
Object Oriented Programming

What is a class?
It is a blueprint or stamp for creating objects

What is a object?
It is a way of organising our code into individual containers that mimics the real world

What keyword do we use to define a class?
`class`

What is required when giving a class a name?
Start with a capital letter

What method do I use on a class to create (instantiate) a new object?
`.new`

What is the difference between a instance variable and a class instance variable?
A instance variable is defined on a object where a class instance variable is defined directly on the class

If I change the value of an instance variable for one object will it change the value of that same instance variable for all objects?
No

What are the methods called on an object that allows your to retrieve and set instance variables?
Getters & setter or readers & writers

What method is always called when an object is instantiated?
`initialize`

Now that we’ve been refresh a little bit about what classes and objects are lets create a new class for an animal. How about a lion.
```ruby
class Lion

end
```
Ok now that we have our class lets add some attributes (instance variables) to our lion.
```ruby
class Lion
    def initialize gender
        @legs = 4
        @speech = “roar”
        @gender = gender
    end
end
```
Alright now that we have our Lion blueprint created lets create two lions, simba and nala.
```ruby
simba = Lion.new :male
nala = Lion.new :female
```
Awesome! But what if we wanted to check the gender of our lions? We would need a getter method right? Lets create our getter with the attr_reader provided by Ruby.
```ruby
class Lion
    attr_reader :gender

    def initialize gender
        @legs = 4
        @speech = "roar"
        @gender = gender
    end
end

simba = Lion.new :male
nala = Lion.new :female

p simba.gender
p nala.gender
```
Nice, now we can retrieve our gender instance variable from our objects. But our lions should be able to speak to each other right? Lets add a instance method that allows them to do that.
```ruby
class Lion
    attr_reader :gender

    def initialize gender
        @legs = 4
        @speech = "roar"
        @gender = gender
    end

    def speak
        "#{@speech} #{@speech}!"
    end
end

simba = Lion.new :male
nala = Lion.new :female

p simba.speak
```
We get “roar roar!” printed to the CLI! Ok now lets create another animal how about a giraffe.

Have the class create the giraffe class with the same instance variables and methods from the lion class. They will just need to change the speech.

Ok so now we have our giraffe class.
```ruby
class Giraffe
    attr_reader :gender

    def initialize gender
        @legs = 4
        @speech = "wa"
        @gender = gender
    end

    def speak
        "#{@speech} #{@speech}!"
    end
end
```
Is our code very DRY?
No, we have repeated ourselves a bunch right. So we should clean up our code someway. We lucky for us Ruby has a feature for classes called inheritance.

### Inheritance

What things did our `Lion` class have in common with our `Giraffe` class?
Pretty much everything right. The only thing that really changed was the noise the two different animals made. So what if we had a way to define all these common features of both classes somewhere else. Then when we define our Lion or Giraffe class we simply state that we want access to those features. Well this is the basis of something know as inheritance.

Inheritance is used to indicated that a class will get features from another class also know as its parent class. Basically as the terminology goes if your are the class begin inherited from than you are the parent class and if you are the class that is doing the inheriting you are known and the child class of that parent.

Lets see this in action. First off we need to define our parent class that will hold all of our common features.

What could we name this class?
How about Mammal. Both lions and giraffe are mammals right? So lets have a class that will hold all our information about mammals which is basically everything our lion and giraffe class currently have in common.
```ruby
class Mammal
    attr_reader :gender

    def initialize gender
        @legs = 4
        @speech = "roar"
        @gender = gender

    end

    def speak
        "#{@speech} #{@speech}!"
    end
end
```
Hmmm…..this doesn’t seem quite right not all mammals are going to “roar” and some don’t even have any legs! Lets modify our Mammal class so that when we create a Mammal we can set the values for these instance variables.
```ruby
class Mammal
    attr_reader :gender

    def initialize gender, legs, speech
        @legs = legs
        @speech = speech
        @gender = gender
    end

    def speak
        "#{@speech} #{@speech}!"
    end
end
```
Ok that’s a bit better. Now we can create two different mammals one for a lion and one for a giraffe.
```ruby
lion = Mammal.new “male”, 4, “roar”
giraffe = Mammal.new “female”, 4, “wa”

lion.speak
giraffe.speak
```
But wait this isn’t what we wanted! We wanted to keep our Lion and Giraffe class and just add the common functionality to both. But before we do that lets explore why we would want to. Isn’t what we are doing right now working just fine?

Why would we want to keep our Lion and Giraffe classes?
At the moment our lion and giraffe variables are exactly the same in terms of instance variables and methods but lions are not giraffes and vice versa. So isn’t there going to be some things that lions can do that giraffes can’t?

What is something that a lion can do that a giraffe can’t?
How about hunting prey. Lions are predators where giraffes sort of chill out and eat leaves from the tops of tress. So how would we add this new method to our lion object? What if we had many different lions would we have to add our hunt method to each and every one? Well there is a better way and that is called inheritance. We can inherit all the goodness from our Mammal class but add our own unique methods for lions.
```ruby
class Lion < Mammal
end

lion = Lion.new "male", 4, “roar"
p lion.speak
```
It worked! Wait….it worked? Lets take a look at what is going on. We used some new syntax with the < operator. This operator when used in a class is for symbolising inheritance. I like to look at it that the Mammal class is being sucked into the `Lion` class. So now the Lion class has all the same instance methods and variables that the Mammal class does. Lets also make our Giraffe class inherit from Mammal.
```ruby
class Mammal
    attr_reader :gender

    def initialize gender, legs, speech
        @legs = legs
        @speech = speech
        @gender = gender
    end
    
    def speak
        "#{@speech} #{@speech}!"
    end
end

class Lion < Mammal

end

class Giraffe < Mammal

end

lion = Lion.new "male", 4, "roar"
giraffe = Giraffe.new "female", 4, "wa"

p lion.speak
p giraffe.speak
```
Awesome so now we have all the functionality of the Mammal class in both the Lion and the Giraffe class! But we still have our problem from earlier where Lions need to hunt and Giraffes should not. Well we can define this instance method directly on the Lion class.
```ruby
class Lion < Mammal
    def hunt(prey)
        puts “The lion slowly talks the #{prey}”
    end
end
```
Now our Lion can hunt!
```ruby
lion.hunt(“Gazelle”)
```
But our Giraffe cannot.
```ruby
giraffe.hunt(“Gazelle”)
```
We get a method not defined error because our hunt method is only defined on our lion. Awesome so now what if we want to add a attribute to the lion only? For instance our lion may or may not have some mane. It doesn’t make sense for this instance variable to be defined on Mammal class because not all Mammals have manes. So it is better suited to be defined on the Lion class directly. Well we can define these instance variables in our initialize method on the Lion class just like normal.
```ruby
class Lion < Mammal
    def initialize
        @mane = false
    end

    def hunt(prey)
        puts "The lion slowly talks the #{prey}"
    end
end
```
Lets try to run our code now. Interesting we get a wrong number of arguments error. It says we have given 3 but it expected 0.

Why did we get this error?
Our `Lion` class's initialize method isn’t accepting any arguments. But wait….it was working earlier! Lets just try accepting these arguments and see what happens.
```ruby
class Lion < Mammal
    def initialize gender, legs, speech
        @mane = false
    end

    def hunt(prey)
        puts "The lion slowly talks the #{prey}"
    end
end
```
Ok so the error has gone away but our lion has lost part of its ability to speak!
```ruby
lion = Lion.new "male", 4, “roar"
p lion.speak
```
Let’s dive in a little deeper and see exactly what our instance variables our for the lion.
```ruby
p lion
```
We only have a `@mane` instance variable. What the heck is going on! Well as soon as we have a instance method that is the exact same name as an instance method on our parent class we no longer use the parents instance method but the one defined in our class.

But we need our parent class initialize method to run!!!!!! Welcome to the super keyword.

### Super

The super keyword has one simple function. It calls the method of the same name on the parent class. So if we use it in our initialize method in the `Lion` class it will call the initialize method on the `Mammal` class. This is perfect!
```ruby
class Lion < Mammal
    def initialize gender, legs, speech
        @mane = false
        super gender, legs, speech
    end


    def hunt(prey)
        puts "The lion slowly talks the #{prey}"
    end
end

lion = Lion.new "male", 4, “roar"
p lion.speak
```
Its working! What we just did is called altered inheritance. We altered the initialize method we inherited by running our own logic either before or after the original. When we call the speak method this is called implicit inheritance, it basically means we are using the inherited method directly. And finally if we override a method we have inherited by using the same name without calling the super method this is called explicit inheritance.

Lets see an example of each of these.
```ruby
class Mammal
    attr_reader :gender

    def initialize gender, legs, speech
        @legs = legs
        @speech = speech
        @gender = gender
    end

    #implicit inheritance
    def speak
        "#{@speech} #{@speech}!"
    end

    def walk
        "Taking a nice stroll"
    end
end

class Lion < Mammal
    #altered inheritance
    def initialize gender, legs, speech
        @mane = false
        super gender, legs, speech
    end

    def hunt(prey)
        puts "The lion slowly talks the #{prey}"
    end

    #explicit inheritance
    def walk
        "Lions don't walk we run!"
    end
end

lion = Lion.new "male", 4, "roar"
puts lion.speak
puts lion.walk
```
We can see that the we were able to use the initialize method on the `Lion` class and the `Mammal` class. We can still call the speak method that we inherit directly from `Mammal`. And when we call the walk method we are using the one on the `Lion` class and not the one from the `Mammal` class.
