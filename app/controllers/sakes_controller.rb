class SakesController < ApplicationController
  def index
    @sweet_sakes = Sake.where(flavor_type: "sweet")   # DBでは英語で登録している場合
    @medium_sakes = Sake.where(flavor_type: "medium")
    @dry_sakes   = Sake.where(flavor_type: "dry")

    # 日本酒一覧ページ用に全件取得
    @sakes = Sake.all.order(:name)
  end

  def show
    @sake = Sake.find(params[:id])
    @reviews = @sake.reviews.includes(:user)
    @review = Review.new
  end
end
