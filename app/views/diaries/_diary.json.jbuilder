json.extract! diary, :id, :user_id, :note, :created_at, :updated_at
json.url diary_url(diary, format: :json)
