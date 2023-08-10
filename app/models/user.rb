class User < ApplicationRecord
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :password_digest, length: {minimum: 6}
    has_many :orders
    has_secure_password
end
