json.array!(@visitor_comments) do |visitor_comment|
  json.extract! visitor_comment, :id, :subject, :name, :email, :content
  json.url visitor_comment_url(visitor_comment, format: :json)
end
