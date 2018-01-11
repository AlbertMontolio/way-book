# app/views/api/v1/restaurants/index.json.jbuilder
json.array! @profiles do |profile|
  json.extract! profile, :id, :first_name, :last_name, :division, :team, :position, :nationality, :birthday, :startway, :endway
  json.own_company_skills profile.own_company_skills do |own_company_skill|
  	json.extract! own_company_skill, :id, :name, :rating, :category_id, :profile_id
  end
end

