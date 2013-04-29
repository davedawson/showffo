class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :challenger_id
      t.integer :challenged_id

      t.timestamps
    end
    add_index :competitions, :challenger_id
    add_index :competitions, :challenged_id
    add_index :competitions, [:challenger_id, :challenged_id], unique: true
  end
end
