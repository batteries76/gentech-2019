greeting = {
    english: "Hello",
    spanish: "Hola",
    french: "Bonjour",
    japanese: "Kon'nichiwa",
    german: "Hallo"
}

farewell = {
    english: "Goodbye",
    spanish: "Adios",
    french: "Au Revour",
    japanese: "Sayonara",
    german: "Auf Wiedersehen"
}

language_dictionary = {
    greetings: greeting,
    farewells: farewell
}

def print_selections()
    puts """
    Please select a language from the following list: 
    1. English
    2. Spanish
    3. French
    4. Japanese
    5. German
    6. Goodbye
    """
    print "Which number?: "
end

selection = gets().strip()

def print_greeting(selection, dictionary)
    if selection == "2"
        puts(dictionary[:greetings][:spanish])
        end_message = dictionary[:farewells][:spanish]
    elsif selection == "3"
        puts(dictionary[:greetings][:french])
        end_message = dictionary[:farewells][:french]
    elsif selection == "4"
        puts(dictionary[:greetings][:japanese])
        end_message = dictionary[:farewells][:japanese]
    elsif selection == "5"
        puts(dictionary[:greetings][:german])
        end_message = dictionary[:farewells][:german]   
    elsif selection == "6"
        print "Thank you for playing, "
        running = false
    else
        puts(language_dictionary[:greetings][:english])
        end_message = language_dictionary[:farewells][:english]
    end
end

print_greeting(selection, language_dictionary)

end_message = language_dictionary[:farewells][:english]
running = true
while(running)
    # print_selections()
    # selection = gets.strip

end

# puts end_message