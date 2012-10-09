class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.string :name
      t.integer :geo_level
      t.string :desc
      t.boolean :is_spot
      t.boolean :is_area
    end
  end
end
