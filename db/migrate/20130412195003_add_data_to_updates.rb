class AddDataToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :data, :string
  end
end
