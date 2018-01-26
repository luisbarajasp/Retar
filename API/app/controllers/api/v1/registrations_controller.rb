require 'facebook/graph.rb'

class Api::V1::RegistrationsController < Api::V1::RestrictablesController
    skip_before_action :restrict_access, only: [:create]

    def create
        if(params[:user][:fb_id] == nil)
            # Normal User
            @user = User.new(user_params)

            if @user.save
                @authentication_token = @user.authentication_tokens.create!
                render :create, status: :created
            else
                head(:unprocessable_entity)
            end
        else
            @user = User.new(user_params)
            if @user.save(validate: false)
                # FIXME: create uipicker and donwload image to device so it uploads like file
                @user.picture_from_url(params[:fb_avatar])
                @authentication_token = @user.authentication_tokens.create(fb_token: params[:fb_token])
                
                @graph = Facebook::Graph.new(params[:fb_token])

                # TODO: instead of calling from here call from active job
                Consumers::Facebook::Friends.create_friendships(@user, @graph.get_friends)

                render :create, status: :created
            else
                head(:unprocessable_entity)
            end
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            head(:created)
        else
            head(:unauthorized)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :name, :email, :fb_id, :password, :password_confirmation)
    end
    def permitted_params
        params.permit(:fb_token, :fb_avatar)
    end
end
