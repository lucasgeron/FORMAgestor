class CreateAppCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :app_calendars do |t|
      t.integer :year
      t.integer :semester
      t.boolean :active, default: true
      t.references :client, null: false,  foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
