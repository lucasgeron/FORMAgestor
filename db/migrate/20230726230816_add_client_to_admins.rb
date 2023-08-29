class AddClientToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_reference :app_admins, :client, null: true, foreign_key: {to_table: :app_clients}
  end
end
