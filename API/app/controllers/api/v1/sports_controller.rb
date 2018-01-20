require 'json'

class Api::V1::SportsController < Api::V1::RestrictablesController
    def index
        @sports = Sport.all
        # con = Consumers::NFL.new.new_season("2017", "REG")
        
        # render json: @sports.to_json(:include => { :teams => { :include => :venue }}), status: :ok
        render json: @sports.to_json, status: :ok
    end

    def show
        @sport = Sport.find(params[:id])
        render json: @sport.to_json(:include => { :teams => { :include => :venue }}), status: :ok
    end

    private
    def sport_params
        params.require(:sport).permit()
    end
end
