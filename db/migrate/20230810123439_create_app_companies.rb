class CreateAppCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :app_companies do |t|
      t.string :name
      t.boolean :active
      t.references :client, null: false,  foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
