class AddUserNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_index :users, :first_name, unique: true
  end
end
