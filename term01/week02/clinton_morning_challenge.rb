greeting = {
    :english => "Hello",
    :spanish => "Hola",
    :japanese => "Koni",
    :french => "Bonjour",
    :german => "Guten Morgen",
    :polish => "dzień dobry",
    :korean => "여보세요"
}

greeting[:japanese] = "Konichiwa"

farewell = {
    :english => "Goodbye",
    :spanish => "Adios",
    :japanese => "Sayōnara",
    :french => "Au revoir",
    :german => "Auf Wiedersehen",
    :polish => "do widzenia",
    :korean => "안녕"
}

puts "What language would you like to be greeted in?\n1. English \n2. Spanish \n3. Japanese \n4. French \n5. German \n6. Polish \n7. Korean \n8. Exit"

greeting_choices = []

user_input = gets().strip().downcase()

while (user_input != "exit")
    current_language = user_input
    greeting_choices << greeting[current_language.to_sym]
    puts greeting[user_input.to_sym]
    # 'polish'.to_sym => greeting[:polish]
    user_input = gets().strip.downcase
end    
print(greeting_choices)
puts

greeting_choices.each do |greeting|
    if(greeting)
        puts(greeting)
    else
        puts("nil is equal to false (And is the only thing that is coerced to false in an if statement")
    end
end
# puts(farewell[current_language.to_sym])