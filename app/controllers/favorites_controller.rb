class FavoritesController < ApplicationController
  before_action :require_login
  before_action :set_sake, only: [:create, :destroy]

  # マイページ用：自分の気になる一覧
  def index
    @user = User.find(params[:user_id])
    # マイページ以外はアクセス不可
    redirect_to root_path, alert: "権限がありません" unless @user == current_user

    @favorite_sakes = @user.favorite_sakes.includes(image_attachment: :blob, reviews: :user)
  end

  # 気になる追加
  def create
    favorite = current_user.favorites.new(sake: @sake)
    if favorite.save
      redirect_to sakes_path, notice: "気になるに追加しました"
    else
      redirect_to sakes_path, alert: "すでに追加済みです"
    end
  end

  # 気になる解除
  def destroy
    favorite = current_user.favorites.find_by(sake: @sake)
    if favorite
      favorite.destroy
      notice = "気になるを解除しました"
    else
      notice = "お気に入りが見つかりませんでした"
    end
    redirect_to sakes_path, notice: notice
  end

  private

  def set_sake
    @sake = Sake.find(params[:sake_id])
  end
end
