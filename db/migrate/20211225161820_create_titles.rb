class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.integer :api_id
      t.string :name

      t.timestamps
    end
  end
end
