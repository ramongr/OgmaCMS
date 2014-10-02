json.array!(@admin_static_pages) do |admin_static_page|
  json.extract! admin_static_page, :id, :title, :slug, :body
  json.url admin_static_page_url(admin_static_page, format: :json)
end
