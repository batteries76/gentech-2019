# *Steps and information:*

In this part I want to run through the steps that I would go through, but also demystify Rails as much as I can on the way. I’ll start with a general overview of Rails that some might find useful.

## *General info*
- The first thing I want to discuss is a broad overview. We are making an app, and we will have a database. The app is going to have all the elements that we have discussed through WEBRick and Sinatra: routes, some ruby code that decides what to do when a user is at a particular route (a ‘controller’, *C*), a ‘model’ (*M*) which we use to talk to the database, and some views, the HTML that we will send back to the user, before the process is repeated (some views, *V*). 
- When the user makes a request to our app they will do so at a route. That request can be made by entering the URL in the browser, or by clicking a button or a link. Each time we will have to find a way to respond to that request. 
- In Rails, the first port of call is the *routes* (`routes.rb`), which is in the `/config` folder. This is the main entry point for our app, and we can check the route that the user is requesting, and then decide what to do. We can do whatever we like. Rails (and the broader community) has many conventions around this, but the simple fact is that we can reply to any route in any way we like.
- In rails the `routes.rb` file is only for routing. It is a list of the routes that we have in our app, and tells them which controller method to find. The hard work is done in the controller, which is ‘mission control’ for our app. 
- The syntax here is, eg `get ‘/books’ => ‘books#index’` with the `books#index` part dilating that this should be handled by the books controller, and specifically the index method within this controller. 
- Each route must point to a *controller* (the _C_ in MVC), and a method within the controller. This is the code that will run to cope with the request to this route. 
- Our controllers all reside in the `app/controllers` folder. We can have as many controllers as we like (or need, preferably), or just one. Usually we have a controller for at least each table we have in our database. That way the controller relates to one table, or ‘resource’. 
- This code could be to send back a simple string, or it could be to send back a whole HTML file. Or it could be to contact the database and return some information stored there.
- Here’s where we need something that talks SQL for us, because as wonderful as SQL is, we really don’t want to have to actually write SQL. Luckily the good people at _Active Record_ have solved this problem for us. They have made a ruby gem we can use so that we can write in ruby, and get back the elements in the database in ruby too. 
- Active Record is our model, which is the _M_ in MVC. Writing to, deleting or reading from, and updating are all done through Active Record, and we will have a ‘model’ for each of the tables in our database.
- The models are kept in the `app/models` folder.
- So our controllers might talk to the database, but they also marshal the views. Views are the HTML (in our case that start as ERb, _E_mbedded _R_u_b_y) that is sent back so that the user can continue on their journey through the site. 
- Every controller will try to render a view by default. But a controller can redirect to. More on that later. 
- Once the request has been responded to, the process starts over again.
- That is the outline of Rails, and the elements and folders mentioned are the most important in what we are dealing with so far. We will expand on that as we build the app.

## *More specific to the project*
- I would always want to think carefully about the data and the assumptions and restrictions that we need to place on these things. For this project this has been narrowed by the deliverables. 
- In general I would start with the models. This might seem a little more abstract, and you might feel like you want to see the app up and running first, but the data is going to drive the app, so I think getting used to thinking about this aspect first is important. 
- I would plot out using pen and paper, or DB Designer a basic structure to be clear what is dependent on what. What are the tables, and what are their relationships. 
- Then start thinking about what other attributes I might have and where these might be stored. And whether I need a join table.
- In the case for the above I would include all the attributes for the deliverables, and have a solid structure set out for the tables and their connections. 
- For this app I want my albums to be dependent on by artists. So I would have a foreign key in the album table that is an artist id (along with other album attributes). 
- For the albums and tracks, because the relationship is going to be many to many, I know that I am going to not have foreign keys in with the tracks of the album tables that relate to each other, but be putting those foreign keys into a join table called albums_tracks. 
- For the next part I am going to go through the steps for artists more manually (not using Rails scaffolding), and then scaffold the rest off the resources.
- The next thing I would want to do, when I have all of this fully nailed down, is to generate my models for each element here. That means a model for my artists, one from albums, one for tracks, and one for albums_tracks. *BUT*..
- I would want to be very careful running the generation command. Double and triple and super multiple check the fields and datatypes and connections before you generate the models. 
- The ‘models’ themselves are not the big issue. They are the Active Record classes that will let us talk to the database. The bigger issue is the migrations that will also be created, and these are the files that will build the tables themselves when we run `> rails db:migrate`. 
- So I would find and double check the Rails generation command. 
- But lets say we are ready to go, and we are not going to use scaffolding for the artists. We need to find the generation command for models, and carefully run that at the command line. 
- This does two main things:  1. It sets up a model for the table. That means that it primes Active Record (AR) to be able to talk SQL with the artists table for us.  2. It also creates a migration file. A migration file is used by Rails to actually make the SQLite or Postgres database tables. By running a migration, we are telling Rails to actually create the table structures that we are going to be needing to put our data into. That means anything to dos with creating a table, or renaming a column, or adding or deleting a column, all these things are done with migrations. 
- Point two above is the main reason to be so careful with the generation command. It is a pain to keep running migrations to fix up your mistakes. It’s inevitable, but we want to not need to do so much work, so setting up ahead of time is preferable to constantly fiddling with the structure of our database after awe casually blast out a ill-thought-through first attempt.
- Now we need to ‘migrate’ to do the actual building step around the database. Ruby the migration command.
- We have our artist model, and our artist table (if everything went well).
- I would double check that things are working ok by running a few Active Record commands in the console, and seeing if I can add an artist to the database. 
- If everything seems to be all ok then I would probably make a few seeds so that the database has something to go on. An empty database is pretty boring. 
- I would find the `seeds.rb` file and make a simple array of hashes. Each of the hashes should have the keys relating to the artists table columns, and I think it’s worth thinking of some artists that you would like to use when your app is up and running. 
- I would add a line of code down the bottom of the seeds file so that I know that it ran (a simple `puts`).
- Then you will loop through this array structure and use AR to save these elements to the database. 
- Then you need to run the command to run the seeds file and have these added to the database. 
- Following that I would open the console again and use AR through my `Artist` model to check that those artists were added into the database. 