class RemoveTypeFromTitle < ActiveRecord::Migration[6.1]
  def change
    remove_column :titles, :type, :string
  end
end
