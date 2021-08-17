class OrderDetail < ApplicationRecord
   belongs_to :item
   belongs_to :order
   
   enum making_status: [:着手不可,:制作待ち,:製作中,:制作完了]
   
   def subtotal
     item_with_tax * quantity
   end   
end
