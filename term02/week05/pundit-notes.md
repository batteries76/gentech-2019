## Notes for Pundit

Pundit help us to stop people going to routes that they shouldn't go to. Simple as that. 

Well, not quite. But the concept is that simple. So far we have cleaned up our app by doing some checking if people are logged in, and presenting buttons to them conditionally (this is *_authentication_*: checking who the user is). Other times we have done the same for particular users (which is *_authorization_*: checking whether this person is allowed in this part of the app). The problem - that some have noticed - is that we can't stop them from manually going to a route - that is, typing `'/artists/3/comment/56/edit'` in the url bar, and changing someone else's comment (which would be amazing).

The choice with Pundit involved is stark: can this user be on this route, or not? And the methods we will use return a *boolean* (or be _coerced_ into one), corresponding to _pass_ (`true`), or _go on, git_ (`false`). That's the main point here. 

I'm going to work through this backwards. 

If you want pundit to check your route, you put this code in the method relating to that route:
```ruby
# in our TracksController:
def new
    # Pundit code to check the authorization for this route
    authorize(Track)
    # 'Normal' code
    @track = Track.new
    @albums = Album.all()
end
```
- We use this `authorize` method, which is a Pundit method. 
- And we pass in the relevant class, or an instance of the class, eg:
```ruby
def edit
    @artists_comment = ArtistComment.find(params[:id])
    authorize(@artists_comment)
end
```
But where is the boolean? Where does the decision about who to let through get made?
It comes in a method that has the *same name* as the method that we call `authorize` from:
```ruby
def new?
    user.role == Role.find(2)
end
```

This last snippet relates to the `def new` from the `TracksController` earlier.
Notice that the expression in this method returns a boolean. If the boolean returned is `true`, then they are allowed to pass, and if it was `false` then they get the Galdalf treatment. 

In this instance I have added 'roles' to users, and these correspond to _Standard_, _Premium_, or _Admin_. For this implementation, only users who are _Premium_ are allowed to add a new track.

We could also decide to let everyone through if we like and are having a good day:
```ruby
def new?
    true
end
```

This code all sits in the `TrackPolicy`, which is named the same as the resource you are protecting, but with the _-Policy_ suffix:
```ruby
class TrackPolicy < ApplicationPolicy

    def new?
        user.role == Role.find(2)
    end

end
```
We can check anything we like in these methods: whether the track was added by the user; whether the user is signed_in; whether the track is longer than 3 minutes (although I don't know why you would). The point is, the thing you return will be coerced into a boolean, and that will decide on the passage of the user at this route. 

This is why the usual thing is to be checking something about the _role_ of the user. _Admin_ can probably do almost anything. _Premium_ gets some extra privileges compared with _Standard_, and so on. But of course the current user is also often a big part of the equation. 

For any of this to work we also need the gem (you know what to do with that by now I hope), and this line in the `ApplicationController`:
```ruby
include Pundit
```

These are the key aspects. Obviously there is more. For starters, in my implementation you can see that the `TrackPolicy` is inheriting from the `ApplicationPolicy`. Here is that policy:
```ruby
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
```
It's the default boilerplate provided by Pundit. Quite a lot of code, and possibly confusing. We are going to ignore the `Scope` part for now. But let's break the rest of it down.

Because our `TrackPolicy` class is inheriting from this class, we are given all of these methods. Which further means that if we ran `authorize(@resource)` on one of the other routes like `def destroy`, and wrote no more code, we would restrict all users from performing this action. Why? Because it is there and returns `false`. If we want to customise that for _tracks_, and, say, have it so that only _admin_ could pass through the `destroy` method, then we would need to overwrite it in our `TrackPolicy` class. Like we have been doing:
```ruby
class TrackPolicy < ApplicationPolicy

    def new?
        user.role == Role.find(2)
    end

    def destroy?
        user.role == Role.find(3)
    end

end
```
Or we could check if the user added the track (assuming the relationship is in the structure):
```ruby
class TrackPolicy < ApplicationPolicy

    def new?
        user.role == Role.find(2)
    end

    def destroy?
        user == @track.user
    end

end
```
Remember, if we don't want these methods to run at all then, just *don't* have `authorize(@blah)` in the method. 

There are obviously a few more things that require explanation. Why `user` and not `current_user`? Pundit gets `user` from `current_user`. Where is `@track` coming from in the policy class? When Pundit uses our code, it runs the initialize with the resource that was passed to `authorize`, where it is referred to as `@record`, but in ours will be `@track`, or whatever we need to help make the decision about whether the user can continue. Why can you pass a Class or an instance? Ahhhh.. magic. (No, I don't know, Brian.)

### Let them down easy..

We get the option to send a message when they have strayed off course. In my example I borrowed some code to rescue the normal Pundit error (big screaming red and white Rails type error-page mess festivus), and instead render a custom page to tell them their type ain't welcome round these parts.

All that is happening is we use the `rescue_from` function to capture the error, and then we tell the application what to do, which is render a page.
```ruby
class ApplicationController < ActionController::Base

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private 

    def user_not_authorized
        render 'layouts/pundit_error'
    end
end
```
And this is the page (called _pundit_error.html.erb_):
```html
<h2> "PUNDIT SAYS 'NO', mate." </h2>
```

### And finally

You also get some helper methods from Pundit, gratis. So you can do some things like this in your views:
```ruby
<% if policy(comment).edit? %>
    <%= link_to 'Edit Comment', edit_artists_comment_path(comment) %>
<% end %>
```
Check those out if you like.

And that's about it really.
(For info about this `Scope` business, tune in next week.. maybe..)