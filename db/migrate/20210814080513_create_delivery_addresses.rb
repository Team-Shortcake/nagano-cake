class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :postal_code
      t.stringDelivery-Addresses :name
      t.integer :user_id
      t.string :address
      t.string :postal_code
      t.string :name

      t.timestamps
    end
  end
end
