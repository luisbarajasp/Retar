class Api::V1::SessionsController < Api::V1::RestrictablesController
    skip_before_action :restrict_access, only: [:create]

    def create
        @update_attr = false        
        if(params[:fb_id] == nil)
            # Normal User
            login = params[:login].downcase
            @user = User.find_by_login(login)
            if @user&.valid_password?(params[:password]) # user && user.valid_password?
                @authentication_token = @user.authentication_tokens.create!
                render :create, status: :accepted
            else
                head(:unauthorized)
            end
        else
            # Facebook User
            @user = User.where(fb_id: params[:fb_id]).first

            if @user.nil?
                @update_attr = true
                render :create, status: :ok
            else
                @authentication_token = @user.authentication_tokens.create(fb_token: params[:fb_token])
                render :create, status: :accepted
            end
        end
    end

    def destroy
        if current_user.id == params[:id]
            @token.delete
            head(:no_content)
        else
            head(:unauthorized)
        end
    end
end
