class FavoritesController < ApplicationController
  before_action :require_login
  before_action :set_sake, only: [:create, :destroy]

  # 気になる一覧（マイページ用）
  def index
    @user = User.find(params[:user_id])
    redirect_to root_path, alert: "権限がありません" unless @user == current_user

    @favorite_sakes = @user.favorite_sakes.includes(image_attachment: :blob, reviews: :user)
  end

  # 気になる追加
  def create
    @favorite = current_user.favorites.new(sake: @sake)
    respond_to do |format|
      if @favorite.save
        format.html { redirect_back fallback_location: root_path, notice: "気になるに追加しました" }
        format.turbo_stream
      else
        format.html { redirect_back fallback_location: root_path, alert: "すでに追加済みです" }
        format.turbo_stream
      end
    end
  end

  # 気になる解除
  def destroy
    @favorite = current_user.favorites.find_by(sake: @sake)
    respond_to do |format|
      if @favorite&.destroy
        format.html { redirect_back fallback_location: root_path, notice: "気になるを解除しました" }
        format.turbo_stream
      else
        format.html { redirect_back fallback_location: root_path, alert: "お気に入りが見つかりませんでした" }
        format.turbo_stream
      end
    end
  end

  private

  def set_sake
    @sake = Sake.find(params[:sake_id])
  end
end
