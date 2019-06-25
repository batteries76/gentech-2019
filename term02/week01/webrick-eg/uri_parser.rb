str = "https://uri.thephpleague.com/#frag"

def uri_parser(str)
    parsed_uri_hash = {}
    new_str = str.split("://")
    parsed_uri_hash[:scheme] = new_str[0]
    new_str.shift
    frag_arr = new_str[0].split("#")
    if frag_arr.length > 1
        parsed_uri_hash[:fragment] = frag_arr.pop
    else 
        parsed_uri_hash[:fragment] = nil
    end
    puts parsed_uri_hash
    puts frag_arr
    domain_and_query = frag_arr[0].split("?")
    if domain_and_query.length > 1

        domain_and_path = domain_and_query[0]
        query = domain_and_query[1]
        domain_and_path_arr = domain_and_path.split('/')

        parsed_uri_hash[:domain] = domain_and_path_arr[0]
        domain_and_path_arr.shift

        parsed_uri_hash[:path] = domain_and_path_arr.join("/")
        parsed_uri_hash[:path] = parsed_uri_hash[:path].split('/')
        parsed_uri_hash[:query] = query
    else
        domain_only = domain_and_query.join()
        domain_parts = domain_only.split('/')
        puts "DOMAIN PARTS"
        print domain_parts
        parsed_uri_hash[:domain] = domain_parts[0]
    end
    if (parsed_uri_hash[:query])
        parsed_uri_hash[:query] = parsed_uri_hash[:query].split('&')
    end
    parsed_uri_hash[:query] = parsed_uri_hash[:query].map do |query|
        parts = query.split("=")
        {
            parts[0] => parts[1]
        }
    end
    puts parsed_uri_hash
    return parsed_uri_hash
end

uri_hash = uri_parser(str)

# class Request
#     def initialize(hash)
#         @body
#         @uri = {
#             uri: hash[:scheme]
#         }
#     end
# end

# request = Request.new(uri_hash)
