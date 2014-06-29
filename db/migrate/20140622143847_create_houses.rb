class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.integer :n_porches
      t.integer :n_floors
      t.integer :n_flats
      t.integer :n_occupants
      t.boolean :key
      t.string :code
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
