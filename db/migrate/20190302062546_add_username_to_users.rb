class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true

    remove_column :users, :email, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
