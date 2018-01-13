class V1::SessionsController < ApplicationController
    def create
        login = params[:login].downcase
        user = User.find_by_login(login)
        if user&.valid_password?(params[:password]) # user && user.valid_password?
            render json: user.as_json(only: [:username, :email, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
    end
end
