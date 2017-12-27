employees = [
	{
		email: "albert.montolio@waygroup.de",
		password: "albert.montolio@waygroup.de",
		division: "Engineering",
		team: "Brigitte Schulz",
		first_name: "Albert",
		last_name: "Montolio",
		phone_number: "+4917638450434",
		position: "Mechanical Engineer & Web Developer",
		title: "Lebenslauf Deutsch",
		document: "image/upload/v1514324187/edzm3iz0vfzn3fte8vw6.pdf"
	},
	{
		email: "linda.rinaldi@waygroup.de",
		password: "linda.rinaldi@waygroup.de",
		division: "Engineering",
		team: "Christian Sailer",
		first_name: "Linda",
		last_name: "Rinaldi",
		phone_number: "+491546430434",
		position: "Account Manager",
		title: "Lebenslauf English",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf"
	},
	{
		email: "matthew.lane@waygroup.de",
		password: "matthew.lane@waygroup.de",
		division: "Engineering",
		team: "Christian Sailer",
		first_name: "Matthew",
		last_name: "Lane",
		phone_number: "+491546858585",
		position: "SE-Team Leiter",
		title: "Lebenslauf Deutsch",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf"
	},
	{
		email: "jane.hiat@waygroup.de",
		password: "jane.hiat@waygroup.de",
		division: "Engineering",
		team: "Brigitte Schulz",
		first_name: "Jane",
		last_name: "Hiat",
		phone_number: "+491324298756",
		position: "SE-Team Leiter",
		title: "Lebenslauf Deutsch",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf"
	},
	{
		email: "bill.weekly@waygroup.de",
		password: "bill.weekly@waygroup.de",
		division: "Personal Wesen",
		team: "Brigitte Schulz",
		first_name: "Bill",
		last_name: "Weekly",
		phone_number: "+491526792656",
		position: "Recruting Manager",
		title: "Lebenslauf English",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf"
	},
	{
		email: "sarah.sample@waygroup.de",
		password: "sarah.sample@waygroup.de",
		division: "Personal Wesen",
		team: "Brigitte Schulz",
		first_name: "Sarah",
		last_name: "Sample",
		phone_number: "+491523333656",
		position: "Modul Leiter",
		title: "Lebenslauf English",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf"
	},
	{
		email: "william.ackerman@waygroup.de",
		password: "william.ackerman@waygroup.de",
		division: "Personal Wesen",
		team: "Brigitte Schulz",
		first_name: "William",
		last_name: "Ackerman",
		phone_number: "+4915239876",
		position: "SE-Team Leiter",
		title: "Lebenslauf English",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf"
	},
]

employees.each do |employee|
	user = User.new(email: employee[:email], password: employee[:password])
	user.save

	profile = Profile.new(division: employee[:division], team: employee[:team], first_name: employee[:first_name], last_name: employee[:last_name], phone_number: employee[:phone_number], position: employee[:position])
	profile.user = user
	profile.save
end






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

COMPANY_SKILLS_KONSTRUKTUR.each do |name|
	skill = CompanySkill.new(name: name)
	skill.category = konstruktor
	skill.save
end




