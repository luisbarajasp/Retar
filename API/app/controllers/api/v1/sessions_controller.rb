class Api::V1::SessionsController < ApplicationController
    def create
        login = params[:login].downcase
        user = User.find_by_login(login)
        if user&.valid_password?(params[:password]) # user && user.valid_password?
            authentication_token = user.authentication_tokens.create!
            render json: [user.username, authentication_token.token], status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
    end
end
