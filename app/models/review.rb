class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sake
  has_one_attached :photo

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true, length: { minimum: 1, maximum: 500 }
end
