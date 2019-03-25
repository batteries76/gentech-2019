# Day 02 A — Terminal & Setup
## Outcomes
The idea is to reveal how the terminal commands work to help them understand a developer environment before installing ruby. This gives the student a good grounding on how to deal with files and folders within the terminal and any of the terminal commands. It isn't essential they remember every command - but they do need to know
## On successful completion of this unit students will be able to:
- use basic commands ```mkdir``` ```cd``` ```touch```
- have a better understanding of the terminal, bash and the file system at a high level
- a brief understanding of SSH (Secure Shell)
## Other admin issues
- Canvas
- Join all the Slack channels
<!-- - Me
- Other teachers -->
- Expectations
- Going ahead
- Amount of work
- AIT and accreditation
## Guided instructions
- video [How Linux is built](https://youtu.be/yVpbFMhOAwE)
Note: Read Outcomes
Cover: 
```linux
uname 
users #show users
uptime
cal #calendar
whoami #who am i
pwd #print working directory
ls #list directory contents
mkdir #make directory
cd #change directory
touch
```
```
less
more
echo
> #newline 
>> #write 
| #pipe
cat #concatenate files
wc #word count to count text document
mv #move
cp #copy
rm #remove
man ls
ls -l
ls -a
ls -la
```
The next part with zip is useful to students to who should usually present their work uploads in zip format.
```
man #manual
info #information
top #table of processes
kill #kill program
history # show bash history
grep # globally search a regular expression 
date
sleep
nano #small text editor
vim / vi (quit: escape then :q)
```
<!-- - breifly discuss where the scripts/executables are kept ```cd /var/bin/```
- breifly discuss how all items on a hard drive are either files or folders
- breifly discuss os system folder structure -->
<!-- ## Other topics
- Repeat ideas about getting help, growth mindset, working through procrastination, and emotional intelligence
- Consider these things to be sharpening the axe
- Assessments, and mindset -->
## Homebrew and telnet
[Install homebrew](https://brew.sh/)
Have fun with telnet 
```linux
brew install telnet
telnet towel.blinkenlights.nl
telnet rainmaker.wunderground.com
telnet telehack.com
``` 
<!-- ### Lastly for fun
- terminal ```say “Thank you for listening”```
- Let students know they will be building their own terminal app
- SSH into your mac from a students computer
### SSH
- If on mac turn on System Preferences > Sharing > Remote Login
- Get ssh address i.e. ```Ruegen@192.168.0.1```
- Open students laptop terminal
- Type ```ssh <address>``` (use -p22 flag if fails)
- add and delete files on desktop from student computer -->
<!-- ### Leave off 
Leave these for later sessions
Do not go through ```chmod```
Do not go through ```base64``` -->
## Resources 
[Terminal cheetsheet](https://github.com/0nn0/terminal-mac-cheatsheet)
[Homebrew packages to explore](https://formulae.brew.sh/formula/)
[Ruby Docs](https://ruby-doc.org/core-2.5.1/)
[String methods](https://www.rubyguides.com/2018/01/ruby-string-methods/)
[Strings Cheatsheet](https://www.shortcutfoo.com/app/dojos/ruby-strings/cheatsheet)
[Why computers are bad at maths](https://blog.codinghorror.com/why-do-computers-suck-at-math/)
[Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
## Install Ruby
- Install rbenv 1.1.1
- Ruby 2.5.1
## Setup
Even though students may not use all these services in the first 3 weeks it is important to get them prepared early.
- Install [Slack](https://slack.com/)
- Install [VS Code](https://code.visualstudio.com/)
- Mac users install [Dash](https://kapeli.com/dash)
- Windows users install [Velocity](http://velocity.silverlakesoftware.com/)
- Linux users install [Zeal](https://zealdocs.org/)
- Signup for [Codepen](https://codepen.io/)
- Signup for [Trello](https://trello.com/)
- Signup for [Figma](https://figma.com/)
- Signup for [Meetup](https://meetup.com/)
- Signup for [Github](https://github.com/)
## Resources
- [GNU Bash](https://www.gnu.org/software/bash/)
- [Unix commands list](https://en.wikipedia.org/wiki/List_of_Unix_commands)
- [Hard Skills/Soft Skills](https://www.youtube.com/watch?v=0FFLFcB9xfQ)
- [Telnet history](https://www.britannica.com/technology/Telnet)

## Challenges
### One: Terminal —
Using only terminal, navigate your file system to:
1. Create a file structure that matches your family tree e.g. a root folder with 2 grandparents, 2 parent directories in each with child folders within those
2. Create a folder called students. Inside the folder, create a few student text files 'jane.txt', etc
3. Rename one of the student files to include full names ('jane doe.txt') - note what happens if you try to use a space. How can you get around this?
4. Delete one student
### Two: Man —
1. Google some interesting commands
2. Use the ‘man’ command to read about the command you have found
3. Experiment with this command, and its flags
### Three: Help —
1. Repeat the above process, but use the —help flag to get info on the command
## Units
- Terminal & Running Ruby
- Tools & Installation
## Review
- Terminal (did anyone find useful commands)
- Brew
- Rbenv
- Ruby
- Gems
 
# Day 02 B — Strings & Numbers

## Outcomes
Students to have a basic comprehension of the data type String, be able to create a string. Be able to have a basic comprehension of variables.

## On successful completion of this unit students will be able to:
- Create a string
- Create a comment
- Manipulate strings
- Undestand a variables
- identify snake_case vs CamelCase
- identify meaningful variable names

## Guided instructions
### Strings
- Set a variable to a string
- discuss snake_case vs CamelCase
- discuss meaningful variable names
- discuss concise and succinct code
- discuss comments in code
- Concatenate a string ```+``` ```<<```
- Discuss non-printing characters
- Non-printing characters  ```\n``` ```\r``` ```\t```
- Discuss input/output
- Print a string to screen ```puts```  ```print```
- Uppercase a string ```.upcase```
- Lowercase a string ```.downcase```
- Capitalize a string ```.capitalize```
- Global Substitution (or pattern matching) ```.gsub```
- Know of String interpolation ```"#{var}"```
- Swap characters ```.swapcase```
- Know of element reference
- multiline strings ```"""``` ```BEGIN``` ```END```
- single quote strings
- double quote strings

<!-- - Take students through the document page for Ruby String -->
### Numbers
- Take students through the document page for Ruby Integer
- integers (whole number)
- addition ```+```
- subtraction ```-```
- multiplication ```*```
- division ```/```
- Take students through the document page for Ruby Float
- float (floating point number)
- modulus ```%```
- Exponent exponential (power) calculation ```**```
- method round up (ceiling) ```.ceil```
- method ```.round```
- method round down ```.floor```
- add assignment operator ```+=```
- subtract assignment operator ```-=```
- multiply assignment operator ```*=```
- divide assignment operator ```/=```

## Next
- Capture a string from input ```gets```
- Discuss input/output
- Methods ```.chomp```  ```.strip```
- range operator end point inclusive ```..``` (1,10) => 1 to 9
- range operator end point exclusive ```...``` (1,10) => 1 to 10
- integer to float ```.to_f```
- float to integer ```.to_f```
- to string ```.to_s```
- To integer ```.to_i```

## Resources
- [ASCII keyboard example](https://codepen.io/Ruegen/pen/WMQRYz)
- [Ruby 2.5.0 doc String](https://ruby-doc.org/core-2.5.0/String.html)
- [Ruby 2.5.0 doc Integer](https://ruby-doc.org/core-2.5.0/Integer.html)
- [Ruby 2.5.0 doc Float](https://ruby-doc.org/core-2.5.0/Float.html)

## Examples
- [Rectangle code](https://github.com/GretchS/lesson-content/blob/master/week-1/rectangle.rb)
- [Area of a sphere code](https://github.com/GretchS/lesson-content/blob/master/week-1/area_sphere.rb)
- [Convert farenheit to celsius code](https://github.com/GretchS/lesson-content/blob/master/week-1/temperature.rb)

<!-- ## Challenges
Day 03 - Strings and Numbers
Gretchen’s Morning Challenges
- check which version of ruby you have installed (if it isn’t 2.4.1, then please see a teacher)
- create a ruby folder inside of your apps folder (if you haven’t already done so)
- create a file inside the ruby folder called ‘strings’ with the ruby extension -->

### One: Running Ruby —
1. Open Pry from your command line by running `pry`
2. Try some basic math (1+1 *enter*)
3. Quit Pry by sending the `exit` command
### Two:
In Pry calculate — 
    1. How many hours are in a year.
    2. How many minutes are in a decade?
    3. How many seconds old are you?
### Three:
What do you think happens when you combine the following floats and integers?
Is the result a float or an integer?
Try computing these in irb —
1. 3.0 / 2
2. 3 / 2.0
3. 4 ** 2.0
4. 4.1 % 2
Why is 4.1 % 2 => 0.099. Look up in the ruby docs or google modulo
Three:
put "Hello world!" onto the screen Make a new variable called 'name', set it's value to your name (as a string)

## More Challenges
1. Describe in words the following code:
- this_var = 0
- this_string = "a string"
- x = 5.5
- badly_named = x * 7
- fergus = “christmas tree”
- nigel = “one “ + “ “two “ + “three.”
- beer = fergus
2. Take the calculations from earlier, and store them in variables. That is, as you do the mathematics, store each line of the calculation in a variable, and use this on the next line to calculate the next step. 

*Beast Mode*
Running Ruby from a file —
1. Use terminal to create a new file (e.g. `touch my-cool-app.rb`)
2. Open the file in your code editor (e.g. `atom my-cool-app.rb`)
3. Write the same Ruby code (1+1) and save + close the file.
4. Run the code! We can do this with the `ruby` command. (e.g. `ruby my-cool-app.rb`)
5. The code runs, but nothing is returned on the screen. Add `puts` to the start of your code and try running the code again! (e.g. `puts 1+1`)
6. Experiment with some basic ruby!
*Beast++*
1. Use interpolation to put your name on the screen
2. Make a new variable called 'siblings', set its value to the number of siblings you have (integer) Use code to put your number of siblings on the screen. Use interpolation to pretty it up, E.g.: “Total Siblings: 3” Use code to increase your number of siblings by one.
3. Use interpolation again to put your new number of siblings on the screen

<!-- ## Units
- Data Types & Variables
- Variables
# TBD
- root directory -->