class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :fathername
      t.string :type
      t.boolean :house_head
      t.string :address
      t.string :city
      t.string :country
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
