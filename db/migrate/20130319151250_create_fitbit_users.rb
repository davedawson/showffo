class CreateFitbitUsers < ActiveRecord::Migration
  def change
    create_table :fitbit_users do |t|

      t.timestamps
    end
  end
end
