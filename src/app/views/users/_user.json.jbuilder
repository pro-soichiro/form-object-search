json.extract! user, :id, :last_name, :first_name, :born_on, :birthplace_id, :created_at, :updated_at
json.url user_url(user, format: :json)
