class Contact
    include ActiveModel::Model
    include ActiveModel::Attributes


    attr_accessor :name, :email, :message

# バリデーション
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :message, presence: true
end
