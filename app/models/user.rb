class User < ApplicationRecord
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    has_many :orders
    has_secure_password
end
