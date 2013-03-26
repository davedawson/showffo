class CreateFitbitData < ActiveRecord::Migration
  def change
    create_table :fitbit_data do |t|

      t.timestamps
    end
  end
end
