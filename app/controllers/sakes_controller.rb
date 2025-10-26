class SakesController < ApplicationController
  def index
    # トップページ用の甘口・中口・辛口分類
    @sweet_sakes  = Sake.where(flavor_type: "sweet")
    @medium_sakes = Sake.where(flavor_type: "medium")
    @dry_sakes    = Sake.where(flavor_type: "dry")

    # 検索処理
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
      )
    else
      @sakes = Sake.all
    end

    # 順番の処理
    case params[:sort]
    when "popular"
      # レビュー数の多い順
      @sakes = @sakes
                .left_joins(:reviews)
                .group(:id)
                .select("sakes.*, COUNT(reviews.id) AS reviews_count")
                .order("reviews_count DESC")
    when "recommended"
      # おすすめ順（例：甘口を優先）
      @sakes = @sakes.order(Arel.sql("CASE WHEN flavor_type='sweet' THEN 0 ELSE 1 END"))
    else
      # 新着順（作成日が新しい順）
      @sakes = @sakes.order(created_at: :desc)
    end
  end

  def show
    @sake = Sake.find(params[:id])
    @reviews = @sake.reviews.includes(:user)
    @review = Review.new
  end
end
