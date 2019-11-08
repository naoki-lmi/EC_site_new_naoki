require "/root/EC_site_new_naoki/app/models/cart"
require 'date'


class Tasks::CartBatch
    

    def self.execute

        threshold =6 
        today = Date.today
        carts = Cart.all
        carts.each do |cart|
            difference = today - Date.parse((cart.created_at).to_s)

            if difference.to_i > threshold
                cart.destroy
                puts "DONE"
            end
            
            
        end

    end


end