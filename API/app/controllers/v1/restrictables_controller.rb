class V1::RestrictablesController < ApplicationController
    before_action :restrict_access

    private
    def restrict_access
        authenticate_or_request_with_http_token do |token, options|
            AuthenticationToken.where(token: token).exists?
        end
    end
end
