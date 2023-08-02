class EnableUnaccentExtension < ActiveRecord::Migration[7.0]
  def change
    execute "CREATE EXTENSION IF NOT EXISTS unaccent;"
  end
end
