json.array!(@admin_pages) do |admin_page|
  json.extract! admin_page, :id, :title, :slug, :body
  json.url admin_page_url(admin_page, format: :json)
end
