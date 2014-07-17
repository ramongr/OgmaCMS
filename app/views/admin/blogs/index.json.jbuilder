json.array!(@admin_blogs) do |admin_blog|
  json.extract! admin_blog, :id, :title, :content, :user_id
  json.url admin_blog_url(admin_blog, format: :json)
end
