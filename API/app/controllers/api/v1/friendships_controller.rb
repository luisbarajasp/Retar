class Api::V1::FriendshipsController < Api::V1::RestrictablesController
    def index
        @friends = current_user.friends
        @pending = current_user.pending_friendships
        render :index, status: :ok
    end

    def create
        @friendship = current_user.friendships.new(friendship_params)

        if @friendship.save
            head(:created)
        else
            head(:unprocesssable_entity)
        end
    end

    def update
        @friendship = Friendship.find(params[:id])
        
        if @friendship.update(friendship_params)
            head(:created)
        else
            head(:unauthorized)
        end
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        
        if @friendship.delete
            head(:no_content)
        else
            head(:unauthorized)
        end
    end

    private
    
    def friendship_params
        params.require(:friendship).permit(:status, :friend_id)
    end
end
