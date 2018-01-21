require 'koala'

module Facebook
    class Graph
        def initialize(access_token)
            # access_token and other values aren't required if you set the defaults as described above
            @graph = Koala::Facebook::API.new(access_token)
        end
        def get_friends
            friends = @graph.get_connections("me", "friends")
            friends
        end
        def get_profile
            profile = @graph.get_object("me")
            profile
        end
        def write_wall(message)
            @graph.put_connections("me", "feed", message: message)
        end
    end
end