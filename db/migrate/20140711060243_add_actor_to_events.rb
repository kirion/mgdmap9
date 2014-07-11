class AddActorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :Actor, :string
  end
end
