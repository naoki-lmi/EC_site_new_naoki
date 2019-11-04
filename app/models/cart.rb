class Cart < ApplicationRecord
    belong_to :user

    has_many :cart_items
end
