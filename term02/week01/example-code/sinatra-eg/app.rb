# Same deal here. Requiring in heaps of code. This time the code will bring with it other gems that will run behind the scenes. There was magic with WEBrick, but it was low level. This time there is much more magic.
# We are also seeing the start of the separation of concerns here, with most of our views not being mixed in with the code, but syphoned off into files in their own folder (/views). This is the V (views - the visible and presentation part of the application) in MVC.
require 'sinatra'

# This next gem will help by reloading your server code without having to stop and restart the server. 
# > gem install sinatra-reloader (just to be confusing).
# Sometimes it will be best to stop and restart the server manually, particularly if the changes are not being reflected - 'sinatra/reloader' is not a perfect solution to that problem.
require 'sinatra/reloader'

# From here we are setting up out routes. The routes can take (almost) any string we like (keep in mind what you know about URI's and delimiters). Sinatra takes care of setting up the response object for us, and doing all the work of attaching things. Much more of the process is performed behind the scenes here. 
get '/' do
    # In this instance we are using Sinatra's erb method to send back a particular embedded ruby file, in this case 'index.erb'. This is convention for the '/', but we could call the file whatever we like.
    erb :index
end

# This example shows that Sinatra will attempt to render the last element in the block by default. 
get '/this-app-works' do
    "<h1> Big Heading something </h1>"
    # If the following was the last line of the block it would still render it. In this example Sinatra concatenates the stings. An array of numbers errors out.
    # arr = ["a","b","c"]
end

# In general, the name of the file to be served is the same as that of the path. This is convention, and often the framework will work on this basis by default (that is, if no file is given then it will look for a file of the same name as the path in /views to render). Sinatra asks that we specify a file though. I could have rendered index.erb, or pokemon.erb, but here I am following convention and rendering elephant.erb.
get '/elephant' do
    erb(:elephant)
end

# This one shows how we can access instance variables in our ERb files. ERbs are HTML files with embedded ruby. The browser *cannot* read ruby, so they have to be processed before they are sent from the server back to the browser. The erb method does this for us. It looks at the value of the instance method, and then processes the HTML that is produced as a result. The pure HTML is then sent out in response (attached as the response message/body).
get '/pokemon' do 
    @pokemon = [
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
    erb(:pokemon)
end

# This route is detritus from early on, but is useful now to show the difference in the HTTP verbs (GET, POST, PATCH, etc). The contrast is made with the post method that follows this method.
get '/frank-says' do
    "Put this in your pipe & smoke it!"
end

# We haven't officially seen how to make a POST request yet, but the key thing here is that it is a totally separate request from the get request with the same path name. It's vital to understand that although the path is the same, the code is separate, and does something different in our application.
post '/frank-says' do 
    "Something different from the get request"
end

# Here is some more hardcoded data that is being served back to the browser. In the future we will not hardcode this data, and instead get it from some sort of storage - a file, a CSV file, a relational database (one that has tables, eg. SQLite, Postgres), or a document/NoSQL database (one that stores objects that look more like hashes, eg. Mongo).
get '/teams' do
    @data = [
        {
            id: 1,
            team: 'Collingwood',
            city: 'Melbourne',
            premierships: 15
        },
        {
            id: 2,
            team: 'West Coast',
            city: 'Perth',
            premierships: 4
        }
    ]
    erb(:teams)
end