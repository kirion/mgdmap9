class FixPersonType < ActiveRecord::Migration
  def up
	rename_column :people, :type, :p_type
  end

  def down
  end
end
