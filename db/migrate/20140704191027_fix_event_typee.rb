class FixEventTypee < ActiveRecord::Migration
  def change
    rename_column :events, :event_typee, :event_type
  end
end
