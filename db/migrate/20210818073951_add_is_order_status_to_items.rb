class AddIsOrderStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_order_status, :boolean
  end
end
