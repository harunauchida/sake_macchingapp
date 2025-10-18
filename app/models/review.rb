class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sake
  validates :rating, inclusion: { in: 1..5 }
end
