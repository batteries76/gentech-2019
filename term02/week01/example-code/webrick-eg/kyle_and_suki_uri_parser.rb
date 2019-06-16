def delimiters(uri)
    delimiter = ['/', '?', '#']
    components = [:path, :queries, :fragment]
    result = {
      delimiters: ['://'],
      components: [:scheme, :authority]
    }
    delimiter.each_with_index do |limiter, index|
      if uri.include?(limiter)
        result[:delimiters].push(limiter)
        result[:components].push(components[index])
      end
    end
    return result
  end
  
  def uri_parser(uri)
    #retrieve the delimiter 
    #take the components 
    #assign the compo to hash 
    uri_hash = {
      uri: uri
    }
    
    comp_delimiters = delimiters(uri)
    delimiter = comp_delimiters[:delimiters]
    components = comp_delimiters[:components]
  
    current_components = uri
    delimiter.each do |limit| 
      temp = current_components.split(limit, 2)
      uri_hash[components.shift] = temp[0]
      current_components = temp[1]
    end
    uri_hash[:fragment] = current_components
    return uri_hash
  end
  
  result = uri_parser('foo://example.com:8042/over/there?name=ferret#nose')
  p result
  
  # p delimiters('foo://example.com:8042/over/there#nose')