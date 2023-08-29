class CreateAppRoleVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :app_role_vendors do |t|
      t.references :client, null: false, foreign_key: {to_table: :app_clients}
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
