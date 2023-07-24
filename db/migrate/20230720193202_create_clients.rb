class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cnpj
      t.integer :licenses
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
