class CartItem < ApplicationRecord
    belong_to :product
    belong_to :cart


end
