class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :sake

  validates :user_id, uniqueness: { scope: :sake_id } # 同じ日本酒を複数登録できない
end

