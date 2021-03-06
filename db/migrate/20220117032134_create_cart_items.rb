class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :member, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
