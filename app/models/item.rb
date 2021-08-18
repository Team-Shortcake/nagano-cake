class Item < ApplicationRecord


  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :is_order_status, inclusion: [true, false]

   def add_tax_price
     (self.price*1.10).round
   end


end
