class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :post_number
      t.string :address

      t.timestamps
    end
  end
end
