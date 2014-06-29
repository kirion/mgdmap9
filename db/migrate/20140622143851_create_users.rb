class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :remember_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.boolean :admin
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
