class Product < ApplicationRecord
    belongs_to :brand
    belongs_to :category
    belongs_to :color
    belongs_to :image
    belongs_to :size

    has_many :cart_items

    has_many :orders



    def self.search(conditions, search) #ここでのself.
        if conditions == "name"
          where(['name  LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。

        elsif  conditions == "brand"
          where(['brands.brand  LIKE ?', "%#{search}%"]).joins(:brand)

        elsif  conditions == "category"
          where(['categories.category  LIKE ?', "%#{search}%"]).joins(:category)

        else
          all #全て表示。
        end
    end

end
