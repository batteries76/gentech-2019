# Week 4, Day 2

## Lesson Material
- Class variables
- Class methods

# Class Variables

A class may contain **instance variables** and **class variables**. Whilst instance variables *belong to an instance of the class*, class variables *belong to the class*. This means that *all instances* will *share* the value of a class variable.

Class variables are *private*.

Consider the following **Invoice** class...

```ruby
class Invoice
    @@count = 0
    def initialize(purchase_details)
        @purchase_details = purchase_details
        @@count += 1
    end
    def self.get_invoice_count
        @@count
    end
    # Methods not shown for sake of brevity.
end
```

This class contains an instance variable called *purchase_details*. We can see it being initialised in the constructor...


```ruby
...
def initialize(purchase_details)
        @purchase_details = purchase_details
        ...
```

This class also contains a **class variable** called *count*. We can see that it has been declared and initialised at the top of the class.

```ruby
class Invoice
    @@count = 0
    ...
```

Class variables are preceded by two **At symbols**.

In this class, the *count* class variable will be used to keep track of the number of invoice instances in memory. We can see that it is being incremented in the constructor...

```ruby
def initialize(purchase_details)
    ...
    @@count += 1
    ...
```

Consider the following two Invoice objects being instantiated...

```ruby
invoice1 = Invoice.new("Purchased a giant rubber chicken...")
invoice2 = Invoice.new("Purchased a tiny unicycle...")
```

After the above statements have executed, *invoice1* contains the following values...

* **purchase_details** = *"Purchased a giant rubber chicken..."*
* **count** = 2

* invoice2* contains the following values...

* **purchase_details** = *"Purchased a tiny unicycle..."*
* **count** = *2*

As we can see, all instances of Invoice share the same *count* value.

## Class Methods

Similarly, **class methods** *belong to the class*.

As we know, the **count** class variable is *private*. Let's create a **class method** which provides read access to it...

```ruby
def self.get_invoice_count
    @@count
end
```

Note the use of the **self** keyword. This is *self-referential*.

Let's now access and print the *count value* via the **Invoice** class...

```ruby
p "The current number of invoices in memory is: " + Invoice.get_invoice_count.to_s
```

...produces...

```ruby
"The current number of invoices in memory is: 2"
```

---