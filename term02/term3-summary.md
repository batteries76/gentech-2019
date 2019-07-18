# Term 2 Summary

## Rails and the rest

I thought it would be best to start at the Rails end, and then use this knowledge as a platform to go back and give some context to the other elements of the web concepts that we went through at the start of the term. 

### Rails - the overview

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

### Authorisation: Pundit
The app is now pretty soundly set up. And with everything we have now we can check that only people who have signed in can get through to certain places. If we have a `roles` table then we might also have a few different types of user. Furthermore, with Devise and our `User` model, and our connection to the `roles` table, we can also start limiting the places that people can access through conditional logic in our views. However, we need another level of checking to stop people entering upon routes that they shouldn't be capable of locating. This is where Pundit steps in. 

There are probably many guides available, but I am going to be self indulgent and put mine here. 
- https://github.com/batteries76/gentech-2019/blob/master/term02/week05/pundit-notes.md
