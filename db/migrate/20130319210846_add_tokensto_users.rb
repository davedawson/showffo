class AddTokenstoUsers < ActiveRecord::Migration
  def change
    add_column :users, :authtoken, :string
    add_column :users, :secrettoken, :string
  end
end
