json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :website
  json.url user_url(user, format: :json)
end
