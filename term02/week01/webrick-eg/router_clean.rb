require 'webrick'
require_relative 'csv_parser'
require 'csv'

class Routes < WEBrick::HTTPServlet::AbstractServlet

    def do_GET(request, response)

        puts "REQUEST PATH"
        puts request.path

        response.status = 200

        case request.path

        when '/'

            response.body = "Hello"
        
        when '/user'

            response.body = get_html('user.html')

        when '/another-path'

            puts "IN ANOTHER-PATH ROUTE"
            query_str = request.query 
            print query_str
            puts

            response.body = query_str.to_s

        when '/teams'

            csv_text = File.read('data.csv')
            csv = CSV.parse(csv_text, :headers => true)

            response.body = csv.to_s

        when '/dunno' 

            response.body = get_html('index.html')

        when '/user-data'

            user = {
                username: 'your_name',
                email: 'youremail@address.com',
                address: 'your_address',
                phone: 'your_phone_no'
            }

            response.body = user.to_s

        when '/city'

            puts "QUERY"
            puts request.query

            selected_city = request.query['city']
            puts "CITY"
            puts selected_city 

            csv_file = CSVParser::CsvParser.new("./data.csv")
            parsed_csv_data = csv_file.parsed_data

            selected_teams = []

            parsed_csv_data.each do |team|
                if(team[:city] == selected_city)
                    selected_teams << team
                end
            end

            response.body = selected_teams.to_s
        
        when '/data'
 
            response['Content-Type'] = 'text/html'

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

            string_data = ""

            data.each do |team|
                team_id = "<h2> #{team[:id]} </h2>"
                team_name = "<h1> #{team[:team]} </h1>"

                string_data += team_id
                string_data += team_name
            end

            puts string_data

            response.body = string_data

        else 

            response.status = 404
            response.body = "NOT A VALID ROUTE"

        end

        if (request.path == '/welcome')
            response.body = "Hi, welcome to the site"
        end
        
    end

    private 

    def get_html(file) 
        path = File.join(__dir__(), 'views', file)   
        html = File.open(path).read()
        return html
    end
end

server = WEBrick::HTTPServer.new(Port: 6600)

trap 'INT' do 
    server.shutdown 
end

server.mount '/', Routes

server.start