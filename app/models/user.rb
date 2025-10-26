class User < ApplicationRecord
  has_secure_password

  # 関連付け
  has_many :reviews, dependent: :destroy

  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_sakes, through: :favorites, source: :sake

  # ActiveStorageでアイコン管理
  has_one_attached :icon

  # バリデーション
  validates :name, presence: { message: "名前は必須です" }
  validates :email,
            presence: { message: "メールアドレスは必須です" },
            uniqueness: { message: "このメールアドレスは既に使われています" }

  # パスワード（新規登録時は必須）
  validates :password,
            presence: { message: "パスワードは必須です" },
            length: { minimum: 6, message: "パスワードは6文字以上で入力してください" },
            on: :create

  # 編集時は空欄でもOK（入力されていれば6文字以上）
  validates :password,
            length: { minimum: 6, message: "パスワードは6文字以上で入力してください" },
            allow_nil: true,
            on: :update

  # ゲストユーザー判定
  def guest?
    email == "guest@example.com"
  end

  # 特定の日本酒を気になる登録済みか
  def favorited?(sake)
    favorite_sakes.include?(sake)
  end
end
