FactoryBot.define do
  factory :cart_item do
    id {}
    cart
    product
    quantity {0}
    
  end
end
