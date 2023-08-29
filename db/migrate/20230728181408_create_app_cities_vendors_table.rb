class CreateAppCitiesVendorsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :app_cities_vendors, id: false do |t|
      t.belongs_to :city, foreign_key: {to_table: :app_cities}
      t.belongs_to :vendor, foreign_key: {to_table: :app_vendors}
    end
  end
end
