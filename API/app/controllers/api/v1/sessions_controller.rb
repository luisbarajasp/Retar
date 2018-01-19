class Api::V1::SessionsController < ApplicationController
    before_action :restrict_access, only: [:destroy]

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
        @current_user = @token.user
        if @current_user.id == params[:id]
            @token.delete
            head(:no_content)
        else
            head(:unauthorized)
        end
    end

    private
    def restrict_access
        authenticate_or_request_with_http_token do |token, options|
            @token = AuthenticationToken.where(token: token).first
            !@token.blank?
        end
    end
end
