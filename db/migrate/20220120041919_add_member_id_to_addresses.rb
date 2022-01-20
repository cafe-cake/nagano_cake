class AddMemberIdToAddresses < ActiveRecord::Migration[5.2]

  def change
    add_column :addresses, :member_id, :integer
  end
end
