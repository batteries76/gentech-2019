# Day 01 — Rails

## Outcomes
- Understand Sinatra as a grounding for Rails
- Understand the basics of Rails structure
- Be able to construct basic routes in Rails, and send back appropriate responses

## Sinatra and Rails - the big picture
- Hopefully the pattern started to make a little more sense toward the end of the week with Sinatra.
- Our web app runs a server (WEBrick) to listen on a port, waiting for incoming requests from the internet (HTTP requests, send by browsers).
- Our Sinatra app sits on top of that and does some processing of that request for us, and then puts that information into `params` for us to dissect.
- It also provides a nice pattern for us to work within. The request hits the server, but we are able to configure the behaviour (which essentially culminates in a response being sent back to the browser) based on what route is provided. A response is always sent. We need to work out how to respond.
- So we created a file containing routes (`get 'my-route' do`), and some ruby that described what we wanted to be sent back for that particular route.
- Sometimes it was a simple string, and other times it might be something more complex, like an ERb file (which was the first time we've seen the separation of concerns, as the elements to be rendered were cast out into their own `views/` folder). 
- Sometimes we wanted to react to what was coming in from the browser (through a *form*, or a *route parameter*, or a *query string*), and reflect that in the response.

- These are a few examples:
```ruby
# Sending back an ERb file
get '/elephant' do
    erb(:elephant)
end
# checking the route parameter, and sending back the right artist (based on route params)
get '/artists/:id' do
    puts params[:id]
    @selected = []
    artists.each do |artist|
        if params[:id].to_i == artist[:id]
            @selected_artist = artist
        end
    end
    erb(:show_artists)
end
# adding an artist through a form (with the information coming through to params)
post '/add-an-artist' do
    new_artist = {
        name: params[:new_artist]
    }
    artists << new_artist
    erb(:artists)
end
```

## To Rails..
- Rails might be a beast, but the same systems are in action. 
- There are some new things to get used to: the *routes* are in their own file, and have some weird syntax; that sytax points at a *controller* and a *method* `get '/books' => 'books#index'; we have to get used to controllers being a separate entity with their own folder; and instead of hitting a CSV for persistence, we are going to need a 'model' to talk to a database (an SQL database) - among other things.
- But:
- We still have a server running underneath it all (often WEBrick). 
- We are configuring routes.
- We have `params`, which Rails is providing for us to contain the extra information sent from the browser.
- We have some ruby code to help process the incoming requests and to marshall the outgoing responses (although this time it's been separated out into controllers, and the methods within them).
- We are often sending back code in ERb files, sourced from a `views/` directory.

## The Overview
- Now we are starting to put together whole apps.
- The game from here is: how do we deal with the incoming route/data, and send back something that can help us to again deal sensibly with the incoming route/data? What information do we have on the page the user is on, to send through to the app, and then respond appropriately?
- We have the ability to link up our app, and dictate what the user will send depending on what they click, or what they enter into the fields we provide them, and then deal with those events. And repeat. 

## Next..
- SQL, and models..