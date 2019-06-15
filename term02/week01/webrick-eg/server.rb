require 'webrick'

root = File.expand_path('./')
server = WEBrick::HTTPServer.new({:Port => 8000, :DocumentRoot => root})

# module WEBrick
#     class HTTPServer
#         def initialize(config_hash)
        
#         end

#         def shutdown()
#         end
#         def start()

#         end
#     end
# end

trap('INT') do 
    server.shutdown()
end

server.start()