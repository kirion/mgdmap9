class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :name
      t.string :event_typee
      t.integer :event_id
      t.string :address
      t.string :city
      t.string :country
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
