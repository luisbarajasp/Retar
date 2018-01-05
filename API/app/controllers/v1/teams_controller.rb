class V1::TeamsController < ApplicationController
    def show
        # @sport = Sport.find(params[:sport_id])
        # @category = @sport.categories.find(params[:category_id])
        # @league = @category.leagues.find(params[:league_id])

        @team = Team.find(params[:id])

        render json: @team.to_json(:include => :venue), status: :ok
    end

    private
    def team_params
        params.require(:team).permit()
    end
end
