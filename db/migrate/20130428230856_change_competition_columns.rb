class ChangeCompetitionColumns < ActiveRecord::Migration
  def change
    drop_table :competitions
  end
end
