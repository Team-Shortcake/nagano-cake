class AddCustomerIdToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_addresses, :customer_id, :integer
  end
end
