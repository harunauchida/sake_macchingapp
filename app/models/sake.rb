class Sake < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  #お気に入り
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  # 日本酒の平均評価（小数点1位まで）
  def average_rating
    return 0 if reviews.blank?
    reviews.average(:rating).round(1)
  end
end
