class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.string :name
      t.string :desc
      t.boolean :is_spot
    end
  end
end
