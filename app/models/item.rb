class Item < ApplicationRecord


  has_many :cart_items
  has_many :order_items
  belongs_to :genre
  
  attachment :image
  
  enum sale_status: {販売中:0,販売停止:1}
  
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :unit_price_without_tax, presence: true
  
end
