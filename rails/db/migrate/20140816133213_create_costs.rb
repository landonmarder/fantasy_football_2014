class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.integer :player_id, null: false
      t.float :value, null: false
      t.timestamps
    end
  end
end
