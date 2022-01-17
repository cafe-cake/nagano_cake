class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :post_number
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_methods, default:"0"
      t.integer :order_status, default:"0"

      t.timestamps
    end
  end
end
