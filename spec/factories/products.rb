FactoryBot.define do
  factory :product do
    id {}
    name  { "product" }
    price {1000}
    brand {FactoryBot.create(:brand)}
    category {FactoryBot.create(:category)}
    size {FactoryBot.create(:size)}
    color {FactoryBot.create(:color)}
    image {FactoryBot.create(:image)}


  end
end
