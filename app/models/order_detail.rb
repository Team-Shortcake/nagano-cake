class OrderDetail < ApplicationRecord
   belongs_to :item
   belongs_to :order

   def subtotal
     item_with_tax * quantity
   end
   
   # {0: 製作不可, 1:製作待ち, 2: 製作中, 3: 製作完了}
   enum product_status: { 制作不可:0, 制作待ち:1, 製作中:2, 制作完了:3 }
end
