class Api::V1::SessionsController < Api::V1::RestrictablesController
    skip_before_action :restrict_access, only: [:create]

    def create
        login = params[:login].downcase
        @user = User.find_by_login(login)
        if @user&.valid_password?(params[:password]) # user && user.valid_password?
            @authentication_token = @user.authentication_tokens.create!
            render :create, status: :accepted
        else
            head(:unauthorized)
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
