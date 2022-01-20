class AddColumnsToItemOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :item_orders, :order_id, :integer
    add_column :item_orders, :item_id, :integer
  end
end
