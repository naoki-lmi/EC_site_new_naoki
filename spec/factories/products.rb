FactoryBot.define do
  factory :product do
    name  { "product" }
    price {1000}
    brand {FactoryBot.create(:brand)}
    category {FactoryBot.create(:category)}
    size {FactoryBot.create(:size)}
    color {FactoryBot.create(:color)}
    image {FactoryBot.create(:image)}

    after(:create) do |product|
      create(:stock,  product: product)
    end


  end
end
