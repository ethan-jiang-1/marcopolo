class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.string :name
      t.string :desc
      t.string :country
      t.integer :level
    end
    add_index :place_categories, :country
  end
end
