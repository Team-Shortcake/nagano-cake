class OrderDetail < ApplicationRecord
   belongs_to :item
   belongs_to :order
   
   def subtotal
     item_with_tax * quantity
   end   
end
