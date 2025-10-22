class FavoritesController < ApplicationController
  before_action :require_login
  before_action :set_sake, only: [:create, :destroy]

  def index
    @favorites = current_user.favorites.includes(:sake)
  end

  def create
    favorite = current_user.favorites.new(sake: @sake)
    if favorite.save
      redirect_to sakes_path, notice: "気になるに追加しました"
    else
      redirect_to sakes_path, alert: "すでに追加済みです"
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(sake: @sake)
    favorite.destroy if favorite
    redirect_to sakes_path, notice: "気になるを解除しました"
  end

  private

  def set_sake
    @sake = Sake.find(params[:sake_id])
  end
end
