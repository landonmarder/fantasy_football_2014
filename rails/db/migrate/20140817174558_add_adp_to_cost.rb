class AddAdpToCost < ActiveRecord::Migration
  def up
    add_column :costs, :adp, :float
  end

  def down
    remove_column :costs, :adp
  end
end
