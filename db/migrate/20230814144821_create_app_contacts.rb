class CreateAppContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :app_contacts do |t|
      t.string :name
      t.string :phone
      t.string :instagram
      t.boolean :informant
      t.boolean :committee
      t.references :negotiation, null: true, foreign_key: {to_table: :app_negotiations}
      t.references :client, null: false, foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
