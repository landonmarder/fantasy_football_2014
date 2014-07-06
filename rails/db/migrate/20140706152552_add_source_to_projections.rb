class AddSourceToProjections < ActiveRecord::Migration
  def up
    add_column :projections, :source, :string, null: false
  end

  def down
    remove_column :projections, :source
  end
end
