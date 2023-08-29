class CreateAppInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :app_interactions do |t|
      t.references :client, null: false, foreign_key: {to_table: :app_clients}
      t.references :vendor, null: false, foreign_key: {to_table: :app_vendors}
      t.references :negotiation, null: false, foreign_key: {to_table: :app_negotiations}
      t.references :status, null: false, foreign_key: {to_table: :app_status_interactions}
      t.text :description
      
      t.timestamps
    end
  end
end
