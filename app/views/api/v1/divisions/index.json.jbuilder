json.array! @divisions do |division|
  json.extract! division, :id, :name
  json.categories division.categories do |category|
  	json.extract! category, :id, :name
  	json.company_skills category.company_skills do |company_skill|
  		json.extract! company_skill, :id, :name
  	end
  end
end