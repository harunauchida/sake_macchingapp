class SakesController < ApplicationController  
  def index
    # トップページ用
    @sweet_sakes  = Sake.where(flavor_type: "sweet")
    @medium_sakes = Sake.where(flavor_type: "medium")
    @dry_sakes    = Sake.where(flavor_type: "dry")

    # 日本酒一覧ページ用の検索処理
    if params[:q].present?
      keyword = params[:q]

      # 日本語→英語 flavor_type の変換対応
      flavor_map = {
        "甘口" => "sweet",
        "中口" => "medium",
        "辛口" => "dry"
      }
      mapped_keyword = flavor_map[keyword] || keyword

      @sakes = Sake.where(
        "name LIKE :keyword OR flavor_type LIKE :keyword",
        keyword: "%#{mapped_keyword}%"
      ).order(:name)
    else
      @sakes = Sake.all.order(:name)
    end
  end

  def show
    @sake = Sake.find(params[:id])
    @reviews = @sake.reviews.includes(:user)
    @review = Review.new
  end
end
