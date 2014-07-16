json.array!(@sidebars) do |sidebar|
  json.extract! sidebar, :id, :title, :type_mask
  json.url admin_sidebar_url(sidebar, format: :json)
end
