class AddStatusToTitle < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :status, :integer
  end
end
