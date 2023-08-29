class CreateAppInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :app_institutions do |t|
      t.string :name
      t.string :abreviation
      t.references :city, null: false, foreign_key: {to_table: :app_cities}
      t.references :client, null: false, foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
