FactoryBot.define do
  factory :cart_item do
    cart
    product
    quantity {0}
    
  end
end
