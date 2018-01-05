require 'sportradar/sportradar.rb'

class V1::SportsController < ApplicationController
    def index
        @sports = Sport.all
        @test = SportRadar::Test.new.test("Luis")

        render json: @sports, status: :ok
    end
end
