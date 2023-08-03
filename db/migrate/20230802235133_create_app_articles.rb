class CreateAppArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :app_articles do |t|
      t.string :title
      t.string :cover_url
      t.text :body

      t.timestamps
    end
  end
end
