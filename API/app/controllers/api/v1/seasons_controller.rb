class Api::V1::SeasonsController < Api::V1::RestrictablesController
    def show
        @sport = Sport.find(params[:sport_id])
        @category = @sport.categories.find(params[:category_id])
        @league = @category.leagues.find(params[:league_id])
        @season = @league.seasons.find_by(year: params[:year], name: params[:name])

        render json: @season.to_json(:include => :games), status: :ok
    end

    private
    def season_params
        params.require(:season).permit()
    end
end
