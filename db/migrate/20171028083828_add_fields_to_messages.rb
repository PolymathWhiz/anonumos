class AddFieldsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :text, :string
    add_column :messages, :sender_id, :integer
    add_column :messages, :recipient_id, :integer
    add_column :messages, :sender_deleted, :boolean, default: false
    add_column :messages, :recipient_deleted, :boolean, default: false
    add_reference :messages, :user, foreign_key: true
  end
end
