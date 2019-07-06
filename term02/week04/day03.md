## Cautionary Tale

So the whole partial mishap at the end of Wednesday is a cautionary tale. Some elements are understandable, but others less forgivable. Hopefully you can learn from my failure. 

I’ve probably made a few too many changes to the code at the start to peel it all apart and find the origin of all the strife. But I think the start of the struggles was the lingering doubts with passing the variables to the partial. Unfortunately, I actually _did_ understand this part, and had I known that I would have looked elsewhere for the source of the issue. More on that later.

There was also the added confusion of several syntaxes when calling on variables, which, depending on your view, is either some nice Rails magic, or some strange arbitrary decisions. But so be it. You need to get used to it, and I didn’t want grumbling about Rails itself to be a big part of all of this. 

### *Partials and Variables*

To the learning. 

Let’s keep it simple. You can pass the local variables in the ‘locals’ hash, and if you don’t want any trouble, then you should pass the partial path as a hash too. 
```ruby
<%= render partial: 'movies/form', locals: { movie: Movie.new(), studio: @studio } %>
```
In this example we are telling Rails to look for the partial in `’movies/views`, and under the name `_form.html.erb`. We are sending in two local variables, one which is an ‘empty’ Movie object (an *Active Record object* - I need to be clear on this), and a Studio object (same deal). 
I do feel like it’s best to get familiar with one syntax for calling partials, and just lock it away. I think this makes the code readable too. To be fair, this will be complicated by the auto-generated code that Rails provides. In the end they all mean much the same thing. When you need to write them or modify then, do it your preferred way, and if a Railshead complains, please poke them in the eye.

What this `locals:` hash does is give access to the variables provided stored under the *key name* on the partial side. I think it’s worth mucking around with, which is why I was toying with things like:
```ruby
<%= render partial: 'movies/form', locals: { movie: Movie.new(), studio: @studio, x: 150, y: “a string, why not”, z: false } %>
```
Then you can have those available, and muck around with them. 
In the partial you could do:
```html
<h2> <%= x %> </h2>
<h3> <%= y %> </h3>
```
In reality you don’t actually want to go down this path too often without a clear reason. One of the main rationales for partials is to have code that you can use multiple times, in a few different contexts. By specifying some variables that you will use on the partial side, you are locking down the partial to require those variables when the partial is called up. Furthermore, if you have changed the original partial, then this can collide when other parts of the application attempt to use it as if it was in its original condition. This is at the centre of my error (which I will get to later).

Then again, if that’s what you want (passing through those variables), go for your life. Partials make your code cleaner, and sometimes you can’t avoid customising them. Just wanted to put that thought out there.

### *`form_with`*

This gear with the `form_with` and the model is more Rails magic. It’s one way Rails provides to define it as a post request to a particular url. It also provides values for the form when the object you pass is complete AR object with values. But let’s look at it in a bit more detail, with examples:
```ruby
<%= form_with(url: '/movies', method: 'post', local: true) do |form| %>
```
Is much the same as writing:
```ruby
<%= form_with(model: movie, local: true) do |form| %>
```
..assuming that you have passed a Movie object through to the partial. Rails takes the object and creates the form that you need. It ‘knows’ the path and the method and produces them for you. I would *strongly recommend* that you use *inspect* to have a look at the HTML that is produced. It can help demystify things quite a lot. 

Please ignore the `local: true` part for now - it refers to whether JS is being used, and we can come back to that later. It has *nothing* to do with the `locals:` (handy).

We can muck around with the format. You might have already noticed that our models are scoped to the views (`locals: { movie: Movie.new()..`), so we can do things like this:
<%= render partial: 'movies/form', locals: { movie: Movie.find(2), studio: @studio } %>

This changes a few things here. Firstly, because we provided an existing record it changes the path to be the appropriate update path, `’/movies/2’`, and it helps by pre-filling the form fields with the appropriate values for us. The button also indicates that it is updating this entry, and not creating a new entry. 

### *Rails Strong Parameters*

The last thing that happens when there is a model provided to `form_with`, is that the parameters relating to the model are wrapped in a hash of the same name. 
This means that they look more like this:
`{ … "movie"=>{"title"=>"Harry Potter", "length"=>"178", "year"=>"2006", "studio_id"=>"1"}, … }`
Than this.
`{ … “title"=>"Harry Potter", "length"=>"111", "year"=>"2011", "studio_id"=>"1", … } `
The key difference is that one has the parameters wrapped in a `movie:` hash and in the other they are flattened into the main hash.

This is where 
```ruby
def movie_params
      params.require(:movie).permit(:title, :length, :year, :studio_id)
end
```
..comes into things. This method is doing a bit of double checking for us. It’s helping us to be safer with the parameters that are entered.  The `require` part refers to the outer wrapping of the parameters, in our case the `movie` part. If this is not provided then it will complain that no ‘movie’ has been provided.
The `permit` part says that we will only accept particular parameters when creating a new entry into the table. If there are other parameters then this will error out. This process is known as *whitelisting*. 
It is done because using hashes we can mass assign attributes for our AR objects - using AR we can do things like `Movie.create(params)`. This gives us some control over this process. 
The simplest way to show why this is necessary is with an example. Imagine a user found a way to fill out a ‘new user’ form, but also send through an extra field that set them as admin (something like `admin => true`) as part of the same entry. If we don’t want this to happen then it’s a major vulnerability. So we can have the parameters we want whitelisted, and everything else is rejected. 

This week will talk more about requiring certain parameters, and doing more checking on the front end, backend, and in the models so that we have even more control over which attributes must be provided, and also how to set defaults (and so on). 

### *My Debugging Errors*

So, to the big mistakes. My trouble started when I spent too much time assuming that I knew what the error was trying to tell me, and that it must relate to a lack of knowledge about partials. I should have looked at the *server logs* more carefully, and just double checked that I was sending the right parameters through to get the item to save, before worrying too much about the partial. I had assumed that the saving part was going ok, and that my problem was with the partial. This was exacerbated by the error I was getting, which referred to the `.erb`, and was telling me that a variable was not defined. So I kept trying to solve the issue there. 

What was happening in reality was that the movie wasn’t being saved, and then the app was rerouting to a page that I didn’t want, which was trying to render the partial, but the partial was now attempting to be rendered but without the locals. This is because when the movie doesn’t save, it sends you to the ‘new movie’ page, which is the normal page for new movies in Railsland. But we (I) have moved the new movie form into the studio show page. Therefore it was being rendered without the locals that it requires in its new environment. When the partial was being called up in that context then it wasn’t passing through the `Studio` object, and so was failing. 

What I should have done (and what I would urge you to do when you have problems in Rails) is to read the error carefully, but also take careful note of the server logs to check what the action has been on the backend, and where you have been routed to in the meantime. Had I not been so single minded that it was a problem with my partial syntax, I would have looked at the response from the server, seen that the movie was not being saved, and also that it was redirecting me to the page that ended up producing the error. That’s my normal MO for Rails issues, and I have often seen the horror in student’s eyes as I fill their carefully written code with my caveman debugging like `puts “IN CREATE METHOD”`. But often you need to get the feel for where things are going so that you can narrow the problem down.