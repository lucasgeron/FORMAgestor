class CreateAppNegotiations < ActiveRecord::Migration[7.0]
  def change
    create_table :app_negotiations do |t|
      t.references :calendar, null: false, foreign_key: {to_table: :app_calendars}
      t.references :course, null: false, foreign_key: {to_table: :app_courses}
      t.references :vendor, null: true, foreign_key: {to_table: :app_vendors}
      t.references :company, null: true, foreign_key: {to_table: :app_companies}
      t.references :status, null: true, foreign_key: {to_table: :app_status_negotiations}
      t.references :client, null: false, foreign_key: {to_table: :app_clients}
     
      t.integer :period
      t.string :reference
      t.boolean :active, default: true

      t.timestamps
      
    end
  end
end
