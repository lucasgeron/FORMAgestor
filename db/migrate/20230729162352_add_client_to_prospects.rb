class AddClientToProspects < ActiveRecord::Migration[7.0]
  def change
    add_reference :app_prospects, :client, null: true, foreign_key: {to_table: :app_clients}
  end
end
