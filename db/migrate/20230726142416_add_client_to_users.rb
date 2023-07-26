class AddClientToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :app_users, :client, null: false, foreign_key: {to_table: :app_clients}
  end
end
