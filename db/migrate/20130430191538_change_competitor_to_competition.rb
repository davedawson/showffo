class ChangeCompetitorToCompetition < ActiveRecord::Migration
  def change
    rename_table :competitors, :competitions
  end
end
