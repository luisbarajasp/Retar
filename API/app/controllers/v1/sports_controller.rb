require 'sportradar/sportradar.rb'
require 'json'

class V1::SportsController < ApplicationController
    def index
        @sports = Sport.all
        # @test = SportRadar::Test.new.test()

        render json: @sports, status: :ok
    end

    def show
        @sport = Sport.find(params[:id])

        render json: @sport, status: :ok
    end

    private
    def sport_params
        params.require(:sport).permit()
    end
end
