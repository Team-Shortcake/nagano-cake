class DeliveryAddress < ApplicationRecord
    
    belongs_to :customer
    
    validates :name, :address, :postal_code, presence: true
    
  def address_all
    self.postal_code+" "+self.address+" "+self.name
  end
end
