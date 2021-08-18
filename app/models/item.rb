class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  
  attachment :image
  
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :item_with_tax, presence: true
  
end
