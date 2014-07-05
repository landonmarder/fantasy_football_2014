class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.integer :player_id, null: false
      t.integer :passing_completions
      t.integer :passing_attempts
      t.integer :passing_yards
      t.integer :passing_tds
      t.integer :interceptions
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.integer :rushing_tds
      t.integer :receiving_yards
      t.integer :receiving_receptions
      t.integer :receiving_tds
      t.integer :fumbles

      t.timestamps
    end
  end
end
