json.array!(@admin_attachments) do |admin_attachment|
  json.extract! admin_attachment, :id, :name, :description
  json.url admin_attachment_url(admin_attachment, format: :json)
end
