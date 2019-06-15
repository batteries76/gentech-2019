# Routes Challenge

1. Make a '/welcome' route which will display a nice welcome message.
2. Make a '/user' route which will serve an html file named 'user.html' that contains some user information (e.g. username, email etc)
3. Make a hash in your server file that has the following format:
 
  ```
  user = {
    username: 'your_name',
    email: 'youremail@address.com',
    address: 'your_address',
    phone: 'your_phone_no'
  }
  ```
 - Now write code that will display this data when you visit the '/user-data' route

## *Beast*
4. Work out how to access the request query string. You will need to send that string to the server in the URI. Parse that string in the server/router, and send back the information in the string in HTML format.
5. Make another html file named 'teams.html'. Now make a route '/teams' which will parse data from the football_teams.csv file and send it back as a response. Use the CVS library, or *better still*, use the CSV parser that you made.
6. Make another route '/perth' which will only display data for the Perth teams

Contents of *football_teams.csv*...
````
id,team,city,premierships
1,collingwood,melbourne,15
2,west coast,perth,4
3,brisbane,brisbane,3
4,gws,sydney,0
5,north melbourne,melbourne,4
6,carlton,melbourne,16
7,sydney,sydney,5
8,melbourne,melbourne,12
9,western bulldogs,melbourne,2
10,fremantle,perth,0
11,gold coast,gold coast,0
12,adelaide,adelaide,2
13,essendon,melbourne,16
14,richmond,melbourne,11
15,geelong,geelong,9
16,hawthorn,melbourne,13
17,st kilda,melbourne,1
18,port adelaide,adelaide,1
````

7. Now configure three more routes in your app. The routes should correspond (roughly) to the data that will be served.
We will give you the data below.
1. Place the data file in your Sinatra app.
2. Create three `.erb` files that are relevant to the data, and put them in your views.
3. Use embedded ruby to render the data in the browser.

Data...

````
# 1. fruits = [ "apple", "kiwi", "orange", "banana"]
# iterate through the fruits array and display them using p tags.

# 2.
pokemon = [
  {
    name:"bulbasaur",
    url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
  },
  {
    name:"ivysaur",
    url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"
  },
  {
    name:"venusaur",
    url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"
  },
  {
    name:"charmander",
    url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"
  },
  {
    name:"charmeleon",
    url:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"
  }
]
# The pokemon array contains pokemon objects with a name and a url property.
# Iterate through the array and diplay the name and the image using the url. Wrap the name and image for each pokemon in a div.

# 3. 
users = [
  {
    email: "amosromaguera@lednerhintz.info",
    admin: false
  },
  {
    email: "weston@jakubowski.org",
    admin: true
  },
  {
    email: "shannonziemann@kelervolkman.name",
    admin: false
  },
  {
    email: "santakirlin@quitzonbogisich.org",
    admin: false
  },
  {
    email: "eliseowitting@pfeffer.biz",
    admin: true
  },
  {
    email: "stanley@wiza.name",
    admin: false
  },
  {
    email: "marita@stroman.org",
    admin: false
  },
  {
    email: "kentabshire@dach.org",
    admin: false
  }
]

# the users array contains user objects. Each user object has two attributes, email and admin. The admin attribute is a boolean.

# - iterate through the users array and display the names in your erb file. 
# - if the user is an admin, display the names in red, otherwise display the name in black.
````