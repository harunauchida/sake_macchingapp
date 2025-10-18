class User < ApplicationRecord
    has_secure_password
    validates :name, presence: { message: "名前は必須です" }
    validates :email, presence: { message: "メールアドレスは必須です" }, 
                      uniqueness: { message: "このメールアドレスは既に使われています" }
    validates :password, presence: { message: "パスワードは必須です" }, 
                         length: { minimum: 6, message: "パスワードは6文字以上で入力してください" }
end
