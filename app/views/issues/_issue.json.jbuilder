json.extract! issue, :id, :serviceman_id, :user_id, :photo, :description, :category, :service_comment, :status_string, :created_at, :updated_at, :title
json.url issue_url(issue, format: :json)
#json.photo url_for(issue.photo)
