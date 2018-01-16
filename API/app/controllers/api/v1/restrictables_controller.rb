class Api::V1::RestrictablesController < ApiController
    before_action :restrict_access

    private
    def restrict_access
        authenticate_or_request_with_http_token do |token, options|
            @token = AuthenticationToken.where(token: token).first
            !@token.blank?
        end
    end
    def current_user
        @current_user = @token.user
    end

    helper_method :current_user
end
