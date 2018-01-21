class Api::V1::RegistrationsController < Api::V1::RestrictablesController
    skip_before_action :restrict_access, only: [:create]

    def create
        @set_username = false
        if(params[:user][:fb_id] == nil)
            # Normal User
            @user = User.new(user_params)

            if @user.save
                authentication_token = @user.authentication_tokens.create!
                render :create, status: :created
            else
                head(:unprocessable_entity)
            end
        else
            # Facebook User
            @user = User.where(fb_id: params[:user][:fb_id]).first

            if @user.nil?
                @user = User.new(user_params)
                if @user.save(validate: false)
                    @set_username = true
                    @user.picture_from_url(params[:fb_avatar])
                    @authentication_token = @user.authentication_tokens.create!
                    puts @authentication_token.token
                    render :create, status: :created
                else
                    head(:unprocessable_entity)
                end
            else
                @authentication_token = @user.authentication_tokens.create!
                render :create, status: :accepted
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
        params.permit(:fb_avatar)
    end
end
