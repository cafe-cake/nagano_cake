class RenameMenderIdColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :mender_id, :menber_id
  end
end
