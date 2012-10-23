class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :unified_address
      t.float :latitude
      t.float :longitude
      t.string  :categories
      t.boolean :is_inactive

      t.timestamps
    end

    add_index :places, :unified_address,                :unique => true
  end
end
