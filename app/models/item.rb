class Item < ApplicationRecord
    has_many :orderitems
    has_many :orders, through: :orderitems
    validates :item_name,uniqueness: true
end
