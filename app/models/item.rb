class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :unit_price_without_tax, presence: true
  validates :is_order_status, inclusion: [true, false]

   def add_tax_price
     (self.price*1.10).round
   end
end
