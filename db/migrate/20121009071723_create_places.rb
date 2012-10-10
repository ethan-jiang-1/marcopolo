class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :alt_name1
      t.string :alt_name2
      t.string :alt_name3
      t.float :latitude
      t.float :longitude
      t.references :place_category
      t.boolean :is_inactive

      t.timestamps
    end
    add_index :places, :place_category_id
  end
end
