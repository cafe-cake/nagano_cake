class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :image_id
      t.integer :sales_status, default:"0"

      t.timestamps
    end
  end
end
