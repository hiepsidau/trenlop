json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :published_at, :author
  json.url article_url(article, format: :json)
end
