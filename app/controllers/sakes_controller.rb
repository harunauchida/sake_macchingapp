class SakesController < ApplicationController
  def index
    @sweet_sakes = Sake.where(flavor_type: "甘口")
    @medium_sakes = Sake.where(flavor_type: "中口")
    @dry_sakes   = Sake.where(flavor_type: "辛口")
  end

  def show
    @sake = Sake.find(params[:id])
    @reviews = @sake.reviews.includes(:user)
    @review = Review.new
  end
end
