# Loads all of WEBrick's code into our file for us to use. 
require 'webrick'
# Loading in Clinton's sick CSV parser. (Pro tip: save the file before trying to run it.)
require_relative 'csv_parser'
# Loading in the CSV library to annoy me later in live coding
require 'csv'

# This is pseudocode to roughly outline a rudimentary 'model' that is our connection between the ruby in this file and the 'database' - in this case a very basic 'database' in the form of a CSV. Your model is like the ruby analog of the database.
# Below is a very rough sketch of how some of these methods might be constructed.
# module MyCSVStuff
#     self.csv_get_all
# end
# data = MyCSVStuff.csv_parser('data.csv')
# more_than_four = []
# data.each do |team|
#     if team[:premierships] > 4
#         more_than_four << team
#     end
# end 
# This is the raw data:
# 1,collingwood,melbourne,15
# 2,west coast,perth,4

# Pseudocode writtent to slightly demystify what is going on behind the scenes in WEBrick, and explain the Routes inheritance line of code somewhat.
# module WEBrick
#     module HTTPServlet 
#         class AbstractServlet
#         end
#     end
# end

# The inheritance in that `class Routes` line is the same as any inheritance that we have done in the past.
# For example:
# class Animal
# end
# class Dog < Animal
# end

# We are defining a Routes class. It inherits from the Abstract Servlet class within WEBrick (two module layers deep). In this case inheritance is a way of modifying or configuring an existing class, so has less in common with the `class Dog < Animal` example above. Code-wise it is very similar.
class Routes < WEBrick::HTTPServlet::AbstractServlet

    # WEBrick builds the request and response objects for us. We get to use them. This method gives us access to the request object for us to modify, and this will be sent by WEBrick after. 
    def do_GET(request, response)

        # Just printing the request object's path to have a look.
        puts "REQUEST PATH"
        puts request.path

        # Printing the request object's query attribute to see this too:
        # puts "REQUEST QUERY"
        # puts request.query

        # Setting the reponse.status's status code to 200 as this then doesn't need to be set in every success route. We will customise the response.body (the content of the response, often HTML) in each route. The 404 will be set for all other routes that aren't specified by us.
        response.status = 200

        # We could have used an if/else set of statements, but a case statement can be easier when you have many possible elsif brackets.
        # eg
        # if (request.path == '/')
        #     response.body = "Hello"
        # elsif (request.path == '/another-path')
        #     etc
        # ..
        
        # Every `when` argument (eg, '/some-path') will be compared to `request.path`
        case request.path
        # a simple route, the 'root route'.
        when '/'

            # Nice happy simple response.
            response.body = "Hello"
        
        when '/user'

            # Here we are using out `get_html` helper method to fetch the HTML out of the file. It simply returns a string, which is what HTML is. 
            response.body = get_html('user.html')

        when '/another-path'

            # Diagnostic puts to see and make clear in the server logs what is happening when this route is hit
            puts "IN ANOTHER-PATH ROUTE"
            # slightly superfluous line of code to put the request query string into a variable.
            query_str = request.query 
            print query_str
            puts
            # After checking that variable, assigning the query_str to the response body for WEBrick to send back to the browser.
            response.body = query_str.to_s

        when '/teams'

            # Here we read in the file, and store it in a variable.
            csv_text = File.read('data.csv')
            # This was an aborted attempt to parse that string.
            csv = CSV.parse(csv_text, :headers => true)
            # ..which we then turn 'to string' and shove into request.body, served cold.
            response.body = csv.to_s

        when '/dunno' 

            # Calls our helper method which returns the contents of the given file. This is a string (which might also be HTML). This is then assigned to the body of the response, and then will be dispatched by WEBrick.
            response.body = get_html('index.html')

        when '/user-data'

            # In this route the data is hardcoded (meaning it will never change: react to user input, update itself from a database, or be refreshed from an API.
            user = {
                username: 'your_name',
                email: 'youremail@address.com',
                address: 'your_address',
                phone: 'your_phone_no'
            }
            # Here it's clumsily chucked back at the browser.
            response.body = user.to_s

        when '/city'

            # This is a good route. Here we want to react to both the route, and the query string. The route we have covered, because here we are. The query parameters we will start getting sorted later.
            puts "QUERY"
            puts request.query
            # Here we are taking the request object and syphoning off the query string's 'city' attribute into a variable. Note that the hash in this instance uses strings as keys, not symbols.
            selected_city = request.query['city']
            puts "CITY"
            puts selected_city 
            # Here we are putting Clinton's parser to work. This creates an instance, of CSVParser.
            csv_file = CSVParser::CsvParser.new("./data.csv")
            # We can find the actual parsed data in the `.parsed_data` attribute/method of this created instance/object.
            parsed_csv_data = csv_file.parsed_data
            # This sets up the storage for the subset of this data. We will add to this in the loop.
            selected_teams = []
            # The CSV parser turned the CSV file into an array of hashes. We can loop through it. 
            parsed_csv_data.each do |team|
                # Get the :team value out of the hash and check it against the city that was given to us in the query string. If it is in there, put it in the selected_teams temporary storage.
                if(team[:city] == selected_city)
                    selected_teams << team
                end
            end
            # Send the selected teams as a string to the browser via ammending the response.body
            response.body = selected_teams.to_s
        
        when '/data'

            # Here we are telling the browser that what we are sending is HTML. 
            response['Content-Type'] = 'text/html'

            # Imaginary call to a parser to read in the data from our 'database':
            # data = my_csv_parser('data.csv')

            # Then this is some of the hardcoded data in the form it would be after being parsed (which as a rule would be an array of hashes - although other structures could be useful too):
            data = [
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
            # Initialise our empty string:
            string_data = ""
            # Loop through, adding to that string:
            data.each do |team|
                # Using string interpolation to make some HTML:
                team_id = "<h2> #{team[:id]} </h2>"
                team_name = "<h1> #{team[:team]} </h1>"
                # Concatenate these onto our string_data string
                string_data += team_id
                string_data += team_name
            end
            # Puts this to the server logs to check that it looks right:
            puts string_data
            # Seeing as it does look ok, attack it to the message or body of the response object so that it can be send back when WEBrick is ready to dispatch it back to the browser:
            response.body = string_data

        else 

            # Captures all the routes that are attempted from the browser, but that we haven't defined.
            response.status = 404
            response.body = "NOT A VALID ROUTE"

        end

        # This was added to show that the case statement is nothing special. Case statements are just if/else statements. We need to place this `if` statement after the case staement, because otherwise it will be overridden by the `else` part of the `case` statement.
        if(request.path == '/welcome')
            response.body = "Hi, welcome to the site"
        end
        
        # The request.body is set only once through this process (as only one part of the case staement is ever hit - except with the recent addition of the `if` statement). After this go_GET method is run, WEBrick packages up our request object (that we have changed in this method), and sends it back across the internet to the browser that called it (as an HTTP response object).
    end

    # Private means that this method is only available within the class, and does not act like an instance method. You can think of these as 'helper' or utility methods. They are used by other methods, and not by the instances.
    private 

    # Helper method to read the HTML out of a file.
    def get_html(file) 
        # Simply returns a string that is the full path to the file that is sent as the argument (and uses a crazy looking function that is really not that scary in reality):
        path = File.join(__dir__(), 'views', file)   
        # Reads from that given file, and stores the content (a string) in the variable 'html', then returns that variable:
        html = File.open(path).read()
        return html
    end
end

# Method names and what they mean example
# def my_method!()
#     # do stuff here
# end

# What we know that WEBrick must be doing behind the scenes (from what we can see):
# The objects below (or similar) must be created because they are passed to the do_GET method (and we know they are objects because we know we can do request.path, and this type of thing).
# request_obj = Request.new()
# response_obj = Response.new()
# Something like the next line must happen because we can see that do_GET is an instance method:
# routes = Routes.new()
# The call to do_GET would look something like this, and is done by WEBrick behind the scenes:
# routes.do_GET(request_obj, response_obj)

# Creates a HTTPServer 'instance' (object) out of the WEBrick module. Configures the port to listen on in the hash argument (setting it to port 6600):
server = WEBrick::HTTPServer.new(Port: 6600)

# Traps the interrupt signal (cntr-C) and then calls our server instance's shutdown method to gracefully shut down the server when we press cntr-C (otherwise it would error out).
trap 'INT' do 
    server.shutdown 
end

# Mounts the server with a path and our Routes class. WEBrick will then make use of the changes that we have made to AbstractServlet in our Routes class.
server.mount '/', Routes
# Kicks off the server with the instance method .start():
server.start