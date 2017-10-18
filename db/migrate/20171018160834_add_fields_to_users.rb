class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :country, :string
    add_column :users, :gender, :string
  end
end
