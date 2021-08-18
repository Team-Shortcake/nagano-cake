class Item < ApplicationRecord


  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  attachment :image

  validates :item_name, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :item_with_tax, presence: true
  validates :is_order_status, inclusion: [true, false]

   def add_tax_price
     (self.price*1.10).round
   end


end
