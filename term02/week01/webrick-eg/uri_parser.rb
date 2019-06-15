str = "https://uri.thephpleague.com/uri/4.0/components/overview?name=fred&type=turnip#frag"

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
        # print domain_and_query
        # puts
        domain_and_path = domain_and_query[0]
        query = domain_and_query[1]
        domain_and_path_arr = domain_and_path.split('/')
        # print domain_and_path_arr
        # puts
        parsed_uri_hash[:domain] = domain_and_path_arr[0]
        domain_and_path_arr.shift
        # print domain_and_path_arr
        # puts
        # print domain_and_path_arr.join("/")
        # puts
        parsed_uri_hash[:path] = domain_and_path_arr.join("/")
        parsed_uri_hash[:query] = query
    else
        domain_parts = domain_and_query.split('/')
        parsed_uri_hash[:domain] = domain_parts[0]
        parsed_uri_hash[:path] = domain_parts.shift.join
    end
    puts parsed_uri_hash
end

uri_hash = uri_parser(str)

class Request
    def initialize(hash)
        @scheme = hash[:scheme]

    end
end

request = Request.new(uri_hash)
