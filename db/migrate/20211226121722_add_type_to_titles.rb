class AddTypeToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :type, :string
  end
end
