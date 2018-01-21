module Consumers
    module Facebook::Friends
        def self.create_friendships(current_user, friends)
            friends.each do |f|
                friend = User.find_by(fb_id: f["id"])
                current_user.friendships.create(status: 1, friend: friend)
            end
        end
    end
end