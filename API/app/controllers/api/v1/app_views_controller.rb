class Api::V1::AppViewsController < Api::V1::RestrictablesController
    def mine
        @live_retos = current_user.live_retos
        # @live_answered_retos = current_user.answered_retos.where(status: 'inprogress')
        
        render :mine, status: :ok
    end
end
