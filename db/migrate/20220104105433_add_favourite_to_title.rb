class AddFavouriteToTitle < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :favourite, :boolean
  end
end
