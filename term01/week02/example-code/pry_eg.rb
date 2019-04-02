require 'pry'
# To use pry:
# 1. > gem install pry
# 2. Uncomment line 1 (require 'pry')
# 3. Uncomment line 150 (binding.pry)

# 1. Starting with fruit, extract the string 'lemon' and give its data type
fruit = ['apple', 'orange', 'lemon']

# 2. Starting with phone, extract 'iPhone', and the weight, and give the datatype of each
phone = {
    brand: 'iPhone',
    price: 90000,
    weight: 362
}

# 3. Extract the string 'West Melbourne' starting with restaurant
restaurant = {
    name: 'Biryani House',
    address: {
        street: 'King St',
        suburb: 'West Melbourne'
    }
}

# 4. Starting with fruit_and_veg, extract 'peach'
fruit_and_veg = [
    ['avocado', 'apple'],
    ['grape', 'guava'],
    ['pear', 'pumpkin', 'peach']
]

# 5. Starting with students, produce the number 29, and the string 'Petra'
student1 = {
    name: 'Roger',
    age: 36
}

student2 = {
    name: 'Petra',
    age: 28
}

student3 = {
    name: 'Juan Martin',
    age: 29
}

students = [student1, student3]
students.push(student2)

binding.pry