class AddItemCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :ItemCount, :integer
  end
end
