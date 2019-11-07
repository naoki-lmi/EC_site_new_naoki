class Credit < ApplicationRecord

    validates :credit_number, presence: true, length: { maximum: 16 }
    validates :expiration_date, presence: true, length: { maximum: 7 }
    validates :security_code, presence: true, length: { maximum: 3 }

end
