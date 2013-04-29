class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.integer :competitor_id
      t.integer :challenge_id

      t.timestamps
    end
    add_index :competitors, :competitor_id
    add_index :competitors, :challenge_id
    add_index :competitors, [:competitor_id, :challenge_id], unique: true
  end
end
