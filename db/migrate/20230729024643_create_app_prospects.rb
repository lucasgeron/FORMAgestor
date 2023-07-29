class CreateAppProspects < ActiveRecord::Migration[7.0]
  def change
    create_table :app_prospects do |t|
      t.references :vendor, null: true, foreign_key: {to_table: :app_vendors}
      t.string :channel
      t.string :institution
      t.string :city
      t.string :course
      t.string :amount
      t.string :year_graduation
      t.string :name
      t.string :phone
      t.string :instagram

      t.timestamps
    end
  end
end
