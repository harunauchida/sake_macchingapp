class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :type_results
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
end
