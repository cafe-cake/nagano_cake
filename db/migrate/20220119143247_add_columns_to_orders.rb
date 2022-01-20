class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :mender_id, :integer
  end
end
