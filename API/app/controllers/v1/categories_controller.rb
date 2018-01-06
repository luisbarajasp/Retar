class V1::CategoriesController < ApplicationController
    def show
        @sport = Sport.find(params[:sport_id])

        @category = @sport.categories.find(params[:id])

        render json: @category.to_json(:include => { :teams => { :include => :venue }}), status: :ok
    end

    private
    def category_params
        params.require(:category).permit()
    end
end
