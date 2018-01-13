class V1::GamesController < V1::RestrictablesController
    def show
        @game = Game.find(params[:id])

        render json: @game.to_json, status: :ok
    end

    private
    def game_params
        params.require(:game).permit()
    end
end
