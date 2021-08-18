class RemoveUserIdFromDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_addresses, :user_id, :integer
  end
end
