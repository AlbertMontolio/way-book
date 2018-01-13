# app/views/api/v1/restaurants/index.json.jbuilder
json.array! @users do |user|
  json.extract! user, :id, :email
end