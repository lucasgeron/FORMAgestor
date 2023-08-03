json.extract! app_article, :id, :title, :cover_url, :body, :created_at, :updated_at
json.url app_article_url(app_article, format: :json)
