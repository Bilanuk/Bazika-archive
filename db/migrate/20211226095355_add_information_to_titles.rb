class AddInformationToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :coverImage, :string
    add_column :titles, :genres, :string, array: true, default: []
    add_column :titles, :description, :text
  end
end
