json.array!(@replies) do |reply|
  json.extract! reply, :id, :user_id, :blog_id, :comment
  json.url reply_url(reply, format: :json)
end
