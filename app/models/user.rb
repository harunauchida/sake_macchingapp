class User < ApplicationRecord
  has_secure_password

  # 名前とメールは必須（新規登録・編集共通）
  validates :name, presence: { message: "名前は必須です" }
  validates :email, presence: { message: "メールアドレスは必須です" }, 
                    uniqueness: { message: "このメールアドレスは既に使われています" }

  # パスワード
  validates :password, presence: { message: "パスワードは必須です" }, 
                       length: { minimum: 6, message: "パスワードは6文字以上で入力してください" },
                       on: :create  # 新規登録時のみ必須

  # 編集時は空欄でもOK（入力されていれば6文字以上）
  validates :password, length: { minimum: 6, message: "パスワードは6文字以上で入力してください" },
                       allow_nil: true, on: :update
end
