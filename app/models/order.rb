class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product

    def self.year_search(value) #ここでのself.
        if value != " "
          where([' created_at  LIKE ?', "%#{value}%"]) #検索とnameの部分一致を表示。
        else
          all #全て表示。
        end
    end


end
