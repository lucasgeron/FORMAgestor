class CreateAppCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :app_courses do |t|
      t.string :name
      t.integer :duration
      t.references :institution, null: false,  foreign_key: {to_table: :app_institutions}
      t.references :client, null: false,  foreign_key: {to_table: :app_clients}

      t.timestamps
    end
  end
end
