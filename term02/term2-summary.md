# Rails Summary

## Rails and the rest

I thought it would be best to start at the Rails end, and then use this knowledge as a platform to go back and give some context to the other elements of the web concepts that we went through at the start of the term. Some parts are somewhat incomplete and will be added to over time, but with what's here you should have a good foundation. 

Please browse through all of this information at least once to see if the topics that you want convered are here. I'm hoping for this to become the catch-all document for all of our Rails concepts from this term. I think it would also be advisable to give it a read through at least once to get the overview (even though I'm reticent to recommend my own writing, I have written this to reflect the priorities that I have stressed through the term). 

## Sections
- [Rails, the overview](#rails,-the-overview)
- [Actually making Rails work](#but-more-practically)
    - [The data](#data)
    - [Migrations](#migrations)
    - [Our Models](#models)
    - [Devise and our User model (authentication)](#a-complication-devise-(authentication))
    - [Seeding](#seeding)
    - [Pundit (authorization)](#authorisation-pundit)
- [What's next?](#so-where-are-we-now-and-what's-left?)
    - [Adding third party stuff](#what-do-image-uploads-and-stripe-have-in-common)
        - [Image uploads](#image-uploads)
        - [Stripe](#stripe)
- [Extended example](#a-detailed-example)

### Rails, the overview

First I want it cleared away how Rails is functioning to make web apps, and I'm going to narrow the context to the types of apps that we have been building in this term - that is, someone visits our website using a browser, and we send HTML (and CSS) to that browser.
- A user at a browser comes to our page, or clicks something on our page.
- When that click is performed, the browser sends a request to our Rails app.
- (First the server and some other elements deal with this request - but we'll come back to this later.)
- The first we know about our Rails app dealing with this request, it is being sorted by our `routes.rb` file. 
- Our routes file then passes responsibility on to whichever controller and method in that *controller* that we have configured. 
- These controller methods are the central handling area for our app. They can talk to the database (or not), and they can do some processing (run some ruby code), and then marshall the view that we want. 
- Let's say that this particular request needs the controller to chat to the database. This is where the *model* comes in.
- In Rails the model is _Active Record_ and it is simply provides a way for us to talk to the database - which wants us to speak SQL - but be able to use ruby. 
- So our controller chats with the DB, and stores the response from the DB into a variable. We might need to do some more processing on this element too. 
- Lastly, the controller sends back some HTML - the *view*.
- In Rails we are able to write our views in ERb format (meaning that we have ruby syntax that we can use to dynamically respond to requests). This must be processed before being sent back, as ruby cannot be read by the browser (and this happens behind the scenes, like much in Rails).
- And then this is packaged up and send back to the browser, where the whole process starts again.

## But more practically..

Ok, so that's just the flow of things through our app (in this instance). What is also important is how we set up a project, and the steps to take along the way.

So let's walk through in slightly abstract terms what the process will be for setting up an app in Rails. At the end of this document I will post the actual steps that I would take in a particular instance (along with the deliverables for that instance). 

### Data
- First we need to think about our data. 
- What is the structure of the world that we are creating? What entities are we dealing with, and how can they be represented in the abstract? what tables will we need to represent these entities? What columns are necessary? How will these tables relate to each other? 
- Taking some time here is vital. Often people want to launch into the code. But more time spent wrestling with these types of ideas early on will mean less mess that you need to clean up in your code down the track.
- Of particular importance will be working out the relations, which means planning where to put your foreign keys, and deciding whether you need a join table for a particular relationship.
- Now let's imagine that you have your data structure sorted. What's next?

### Migrations
- Migrations are (mostly) used to build the structure of the database. 
- We can generate them through the rails tasks. 
- eg, `rails g migration AddSomethingToSomething table:references`
- If we name things well and specify the tables or columns that need to be created, then the migration file produced will be close to what we need to happen. But if not we will have to get into the file and change things.
- This migration generation command just creates the file so that it's ready to go when the rake (rails) task runs. We still need to migrate to actually construct the table or change:
- `rails db:migrate`
- Rails then communicates with the database and creates the tables (or parts thereof) that we need.
- Now we have tables, but are rusty with our SQL. So we need..

### Models
- We have seen in the past that we can create the tables and models together. And this makes sense: the models are needed to do the chatting with the database. 
- But if we just generate the migrations, then we also need to connect our models to the database. I've separated the process above to show the distinction between the two, but I am more than happy for people to create the models and the tables at the same time.
- In Rails if we create a model and no migration has been created earlier, Rails assumes that we will need the table with the model. A table can exist without a model, but a model with no table doesn't really make sense.
- In Rails we will have a model for each of the tables we make.
- We also need to tie these models together so that Active Record can provide the methods we need to make use of the connections between tables.
- You will need to think these through and perhaps look at the Rails docs to work out which associations you need. 

### A complication: Devise (authentication)
The above has us pretty close to getting the data set up. We have the tables in place. We have our models in place. We would be thinking about seeding. But first I need to circle back to a specific instance: a _User_ model. And we don't want to have to do all the work that it would take to get this system up and barking.
- If you have a User model, you will likely want to use Devise. 
- https://github.com/plataformatec/devise
The main steps for these types of things have certain similarities that you can start to get used to.
With devise the main steps are:
- Install the gem.
- Bundle.
- Run the installing command (`rails generate devise:install`).
- (This previous command will give you four optional commands, including generating the views. It is well worth stopping at that point and running through the ones that you think might be helpful.)
- Then generate your model.
- And then.. migrate of course.
- Now you have to make a decision about at which point the app will authenticate users. 
- And you now also have several Devise methods to make use of. 

### Seeding
- You can now put together a seed file to load the database.
- Remember to use `.save!` to get some feedback if things go wrong.
- You may want to add a `puts` statement to your file so that you get some feedback when it runs.

### Authorisation: Pundit
The app is now pretty soundly set up. And with everything we have now we can check that only people who have signed in can get through to certain places. If we have a `roles` table then we might also have a few different types of user. Furthermore, with Devise and our `User` model, and our connection to the `roles` table, we can also start limiting the places that people can access through conditional logic in our views. However, we need another level of checking to stop people entering upon routes that they shouldn't be capable of locating. This is where Pundit steps in. 

There are probably many guides available, but I am going to be self indulgent and put mine here. 
- https://github.com/batteries76/gentech-2019/blob/master/term02/week05/pundit-notes.md
The summary is:
- Install Pundit.
- Put `authorize` methods within the controller methods that we want Pundit to take over.
- Sometimes we will pass an instance because we will need it in the policy (`authorize(@book)`), and other times we will just need to pass the class (`authorize(Book)`).
- Write up the 'policies' for the resources (which means returning a boolean from the methods).
- We can inherit from the base Pundit policy if we like.
- The extension is to set a particular page or redirect to replace the regular pundit error message.

## So where are we now and what's left? 
At this point we have the power to create very significant web apps. With just these techniques you could provide the vast majority of the functionality that you will need to have the structure of your apps up and working for the project coming up. But there are a few additional elements that we might add to make our apps more complete. These are: image uploads, Stripe, and styling (SCSS). 

Of course, there are many little bits and pieces that we can add, and fine tune, and get better at. I will include some summaries and notes on elements like scaffolding, partials, Rails forms, and whatever else has been missed with these broad strokes.

Before that though..

### What do image uploads and Stripe have in common?
Stripe is third party, as is Amazon S3. So for both we need a way to carefully integrate them into our projects. Stripe is more of a legal entitiy than it is a coding helper. Sure, there's code behind the scenes, but the key thing that it provides (which we have little change of recreating), is the ability to check credit cards (and the associated storage and legal elements). And Amazon is cloud storage for files. I mean, they are both more than this, but at heart this is all we are dealing with. 

Both will end up charging you money if you chew through their services, and both require a combination of public and provate keys for authentication. As a result we need to use our `credentials.yml.enc`. This is an encrypted file that will store these keys. This file is encrypted using the master key (`master.key`). We can't just access this file through a simple click, and so we need these convoluted terminal commands:
- `> EDITOR="code --wait" rails credentials:edit` to open the credentials file in VSCode, or, if that doesn't work:
- `> EDITOR=/usr/bin/vim rails credentials:edit` to open in _vi_.
_*vi*_ is merely a simple text editor that opens up within the terminal. 
- Hit `i` (insert mode) to edit (which then will mostly edit as normal).
- Hit `esc` to get out of insert mode. 
- Type `:wq` or `:q!` (make sure you are including the colon) to save and exit.

Now we have made sure that the credentials are in the system, and also that we are the only ones who can get at them. We have to be very careful that the master key is never sent to GitHub (which is the default case, fear not).

Other similarities between the two processes are:
- Both will require gems.
- Both will require a little more Rails config. 

I'm not going to reinvent the wheel - below are links to the guides for both integrations:

### Image uploads
- https://gist.github.com/anharathoi/5e60d9e3711cc94e42335768b3f7871a 

### Stripe
- https://gist.github.com/anharathoi/730a93f1434c85c30b44276007cb9c77

## Other topics
We now have everything we need to make very complicated apps, but also be able to add nice touches like image uploads and Stripe. We need to also clear up a few of the topics that come along with getting used to Rails, but we have passed by in this overview. 

I will be adding to this as time permits and I get to the summaries. In the meantime, here is a document that includes some of my summaries of *partials*, *form_with*, and *Rails strong params*. It's relatively brief, but still has some elements that hopefully prove useful.
### *Partials*, *form_with*, and *Rails strong params*
- https://github.com/batteries76/gentech-2019/blob/master/term02/week04/day03.md


## A Detailed Example
Below I'm attaching the mini project, along with my detailed (although as yet incomplete) steps for how I would go about completing this particular task. 

The early part of the steps is also more general Rails information which might be handy to read through (although it will be much the same as some of what is written above). Occasionally I have found that reading something similar on the same topic makes some new part of it click. 

It is on my list of things to do to get this complete. 

### Rails Mini Project

You will be paired up for this task. A list of steps will be provided over the course of the day that may help with trouble areas. For now, think through how you would make this app based on the deliverables. The deliverables are ordered so that you should be able to approach them as something of an instruction set. 
If you are more comfortable with the Rails process than your partner, please use this as a chance to help them to understand what is happening. Being able to do this is also a valuable skill.  All going well you will soon be working with much more experienced coders by your side, and I hope they have this skill in spades.

### Deliverables
- CRUD operations for artists, albums, and tracks, with the following stipulations:
- The root route will be the *same* as the artists index page.
- Artists must have *at least* name, year of birth, and whether they are currently active (and as many others as you would like - this applies to all resources).
- Albums must have attributes of (at least) title, year, and length.
- Tracks must have title and length.
- Artists will have many albums, but albums have *one and only one* artist. 
- Albums can have many tracks (or none), and tracks can have many albums (but at least one)
- Seed your database with a few of each resource using the seed file or console (I can help by adding to the seed file if required, although you may need to modify the file based your your resource configurations).
- Provide index pages for each of artists, albums and tracks
- Provide a link to add a new artist on the artist index page (and a new artist page to add an artist). 
- Provide navigation links up the top of the page (that remain on every page) that link to the artists, albums, and tracks index pages.
- Show, edit, and delete options also available on the index page of every resource (artists, albums, and tracks), including show pages available through a link via the listed entity (that is, if on the index page you see “Beyonce”, you can click the string “Beyonce” to get to the show page for the artist). 
-  New albums are *only* to be added on the artists show page (so the album would be added to that specific artist, and albums must be tied to an artist). 
- The album index page must *not* have any way to add a new album.
- The album show page lists all the tracks added to this album, or informs the user that there are no tracks added to this album as yet. 
- The album show page also has *two* ways to add a track to the album. The track can be added by choosing from a list of tracks already on the database (where the track is assumed to be added to the album featured on the show page). *Or* you can add a totally new track (again, that will be added to the current album).
- A link to create a new track is on the tracks index page. Following that link presents a form. The form will provide field for all the elements of the track, and a drop down list of albums to choose from to add the track to. 
- The track show page will also list the albums that the track appears on.
- Every page should have appropriate links to move comfortably through the site.

### Extension
- Install the _*devise*_ gem. Follow the steps carefully.
- Make sure you also have all the views.
- Put the sign-in and logout options into the navbar.
- Add a comments section for the artists page.
- Add a form to accept a new comment below the form to add an album (with an appropriate heading above it.
- If there are any comments for this artist, they should appear in a list below the form (or the form can come after if you like).
- Each comment should have some information about the user who made the comment, and the content.
- If there are no comments then the user should be informed about this.
- Now have a user be able to edit or delete a comment.
- Make sure that the user can only edit/delete *their own comment*. 

### And further extension
- Think through the tables and relationships for an implementation of _‘likes’_ on albums.
- Each user is going to have many _likes_ (of albums), but can only _like_ each album once.
- Each album can have many _likes_ (from different users).
- Now add a helper method to create a list of options for albums to choose from when adding a track.
- Now add a helper method to create a list of options for tracks to choose from when adding an album.

## Steps and information:
In this part I want to run through the steps that I would go through, but also demystify Rails as much as I can on the way. I’ll start with a general overview of Rails that some might find useful. *General:*
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

### More specific to the project
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