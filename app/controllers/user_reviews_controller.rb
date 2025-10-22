class UserReviewsController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  # マイページのレビュー一覧
  def index
    if @user.guest?
      flash[:alert] = "ゲストユーザーのレビューは閲覧のみ可能です。"
    end
    @reviews = @user.reviews.includes(:sake)
  end

  # 編集ページ
  def edit
  end

  # 更新処理
  def update
    if @review.update(review_params)
      redirect_to user_reviews_path(@user), notice: "レビューを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除処理
  def destroy
    @review.destroy
    redirect_to user_reviews_path(@user), notice: "レビューを削除しました"
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_review
    @review = @user.reviews.find(params[:id])
  end

  def check_user
    if current_user.guest? || @review.user != current_user
      redirect_to user_reviews_path(@user), alert: "このレビューは編集・削除できません"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :content, :photo)
  end
end
