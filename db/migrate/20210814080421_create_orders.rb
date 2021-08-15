class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment
      t.integer :shipment_charge
      t.string :postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :total_price
      t.integer :order_status

      t.timestamps
    end
  end
end
