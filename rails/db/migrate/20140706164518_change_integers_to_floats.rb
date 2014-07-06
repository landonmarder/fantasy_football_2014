class ChangeIntegersToFloats < ActiveRecord::Migration
  def up
    change_column :projections, :passing_completions, :float
    change_column :projections, :passing_attempts, :float
    change_column :projections, :passing_yards, :float
    change_column :projections, :passing_tds, :float
    change_column :projections, :interceptions, :float
    change_column :projections, :rushing_attempts, :float
    change_column :projections, :rushing_yards, :float
    change_column :projections, :rushing_tds, :float
    change_column :projections, :receiving_yards, :float
    change_column :projections, :receiving_receptions, :float
    change_column :projections, :receiving_tds, :float
    change_column :projections, :fumbles, :float
  end

  def down
    change_column :projections, :passing_completions, :integer
    change_column :projections, :passing_attempts, :integer
    change_column :projections, :passing_yards, :integer
    change_column :projections, :passing_tds, :integer
    change_column :projections, :interceptions, :integer
    change_column :projections, :rushing_attempts, :integer
    change_column :projections, :rushing_yards, :integer
    change_column :projections, :rushing_tds, :integer
    change_column :projections, :receiving_yards, :integer
    change_column :projections, :receiving_receptions, :integer
    change_column :projections, :receiving_tds, :integer
    change_column :projections, :fumbles, :integer
  end
end
