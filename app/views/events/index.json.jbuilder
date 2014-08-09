json.array!(@events) do |event|
  json.extract! event, :id, :title, :body
  json.start event.start_time
  json.end event.end_time
  json.allDay false
  json.color 'default'
  json.textColor 'default'
  json.url event_url(event, format: :html)
end
