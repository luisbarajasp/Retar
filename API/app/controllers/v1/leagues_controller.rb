class V1::LeaguesController < ApplicationController
    def show
        @sport = Sport.find(params[:sport_id])
        @category = @sport.categories.find(params[:category_id])
        @league = @category.leagues.find(params[:id])

        render json: @league, status: :ok
    end

    private
    def league_params
        params.require(:league).permit()
    end
end
