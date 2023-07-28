class CreateAppVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :app_vendors do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :role
      t.references :client, null: false, foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
