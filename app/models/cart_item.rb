class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :number_of_items, presence: true
end
