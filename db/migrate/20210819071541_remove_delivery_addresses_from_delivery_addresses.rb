class RemoveDeliveryAddressesFromDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_addresses, :Delivery_Addresses, :string
  end
end
