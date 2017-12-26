albert = User.new(email: "albert.montolio@gmail.com", password: "albert.montolio@gmail.com")
albert.save

profile = Profile.new
profile.user = albert
profile.save

CATEGORIES = ["SE-Team Leiter", "Modul Leiter", "Sales", "Programmierer", "Project Management", "Business Developer", "Konstruktor"]

CATEGORIES.each do |name|
	Category.create(name: name)
end

COMPANY_SKILLS_SE_TEAM_LEITER = ["gAMS", "NAELs", "Team Runde", "Deutsch", "English", "iDIAS", "Kosten Analyse"]

seteamleiter = Category.where(name: "SE-Team Leiter")[0]

COMPANY_SKILLS_SE_TEAM_LEITER.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = seteamleiter
	skill.save
end


COMPANY_SKILLS_MODUL_LEITER = ["gAMS", "NAELs", "Module Runde", "Deutsch", "English", "Entscheidungsrunde", "Investition Analyse", "PoKa Runde", "Ko Runde"]

modulleiter = Category.where(name: "Modul Leiter")[0]

COMPANY_SKILLS_MODUL_LEITER.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = modulleiter
	skill.save
end

COMPANY_SKILLS_SALES = ["Negotation", "Anfrage Vorbereitung", "Präsentationen Vorbereitung", "Client experience"]

sales = Category.where(name: "Sales")[0]

COMPANY_SKILLS_SALES.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = sales
	skill.save
end

COMPANY_SKILLS_PROGRAMMIERER = ["Ruby", "Rails", "JavaScript", "HTML", "CSS", "Daten Banken", "Java", "Python", "R", "Visual Basic"]

programmierer = Category.where(name: "Programmierer")[0]

COMPANY_SKILLS_PROGRAMMIERER.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = programmierer
	skill.save
end

COMPANY_SKILLS_PROJECT_MANAGEMENT = ["Leadership", "Team Management", "RPlan", "Microsoft Office Project Management", "Konfliktmanagement"]

project_management = Category.where(name: "Project Management")[0]

COMPANY_SKILLS_PROJECT_MANAGEMENT.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = project_management
	skill.save
end


COMPANY_SKILLS_BUSINESS_DEVELOPER = ["Excel", "Market analyse", "Konkurrenz Analyse", "Visual Basic", "R", "Python", "PowerPoint", "Kunde Betreung", "Messe Erfahrung", "Workshops Vorbereitung"]

business_developer = Category.where(name: "Business Developer")[0]

COMPANY_SKILLS_BUSINESS_DEVELOPER.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = business_developer
	skill.save
end


COMPANY_SKILLS_KONSTRUKTUR = ["CATIA", "Automotive Erfahrung", "Bauteiel Kenntnisse", "Zeichnungen"]

konstruktor = Category.where(name: "Konstruktor")[0]

COMPANY_SKILLS_PROJECT_MANAGEMENT.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = konstruktor
	skill.save
end




