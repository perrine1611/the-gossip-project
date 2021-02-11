json.extract! comment, :id, :author, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
