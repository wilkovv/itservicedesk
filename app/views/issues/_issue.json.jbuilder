json.extract! issue, :id, :serviceman_id, :user_id, :description, :photo, :category, :service_comment, :status_string, :created_at, :updated_at
json.url issue_url(issue, format: :json)
