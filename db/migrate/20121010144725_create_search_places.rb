class CreateSearchPlaces < ActiveRecord::Migration
  def change
    create_table :search_places do |t|
      t.string :name
      t.references :place

      t.timestamps
    end
    add_index :search_places, :place_id
    add_index :search_places, :name
  end
end
