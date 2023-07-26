class CreateAppCities < ActiveRecord::Migration[7.0]
  def change
    create_table :app_cities do |t|
      t.string :name
      t.string :state
      t.references :client, null: false, foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
