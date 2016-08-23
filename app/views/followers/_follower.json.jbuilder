json.extract! follower, :id, :user_id, :follower_id, :created_at, :updated_at
json.url follower_url(follower, format: :json)