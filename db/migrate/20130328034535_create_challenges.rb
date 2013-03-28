class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :task
      t.string :description

      t.timestamps
    end
  end
end
