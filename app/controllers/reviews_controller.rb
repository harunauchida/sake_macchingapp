class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_sake
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  # 新規レビュー作成
  def create
    @review = @sake.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to sake_path(@sake), notice: "レビューを投稿しました"
    else
      @reviews = @sake.reviews.includes(:user)
      render "sakes/show", status: :unprocessable_entity
    end
  end

  # レビュー編集ページ
  def edit
  end

  # レビュー更新
  def update
    if @review.update(review_params)
      redirect_to sake_path(@sake), notice: "レビューを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # レビュー削除
  def destroy
    @review.destroy
    redirect_to sake_path(@sake), notice: "レビューを削除しました"
  end

  private

  def set_sake
    @sake = Sake.find(params[:sake_id])
  end

  def set_review
    @review = @sake.reviews.find(params[:id])
  end

  # 他ユーザーのレビューを編集・削除できないように
  def check_user
    unless @review.user == current_user
      redirect_to sake_path(@sake), alert: "あなたはこのレビューを編集できません"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :content, :photo)
  end
end
