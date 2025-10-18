class SakesController < ApplicationController
    def index
        @sakes = Sake.all
    end

    def show
    @sake = Sake.find(params[:id])
    @reviews = @sake.reviews.includes(:user)
    @review = Review.new
    end
end
