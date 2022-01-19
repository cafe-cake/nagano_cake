class CreateItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :item_orders do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price
      t.integer :count
      t.integer :making_status, default:"0"

      t.timestamps
    end
  end
end
