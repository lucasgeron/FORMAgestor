class CreateAppStatusNegotiations < ActiveRecord::Migration[7.0]
  def change
    create_table :app_status_negotiations do |t|
      t.string :name
      t.boolean :active, default: true
      t.string :icon
      t.string :style
      t.string :color
      t.references :client, null: false, foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
