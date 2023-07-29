class AddSlugToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :app_clients, :slug, :string
  end
end
