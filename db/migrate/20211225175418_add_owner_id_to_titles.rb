class AddOwnerIdToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :owner_id, :integer
  end
end
