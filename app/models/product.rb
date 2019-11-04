class Product < ApplicationRecord
    belongs_to :brand
    belongs_to :category
    belongs_to :color
    belongs_to :image
    belongs_to :size

    has_many :cart_items



    def self.search(search) #ここでのself.はUser.を意味する
        if search
          where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
        else
          all #全て表示。User.は省略
        end
    end

end
