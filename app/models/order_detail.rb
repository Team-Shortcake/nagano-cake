class OrderDetail < ApplicationRecord
   belongs_to :item
   belongs_to :order

   def subtotal
     item_with_tax * quantity
   end

   # {0: 製作不可, 1:製作待ち, 2: 製作中, 3: 製作完了}
<<<<<<< HEAD
   enum production_status: { cannot: 0, waiting: 1, making: 2, done: 3 }
=======
   enum production_status: [:製作不可, :製作待ち, :製作中, :製作完了]
>>>>>>> origin/develop
end
