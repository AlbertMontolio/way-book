require "faker"

divisions_hash = [
	{
		name: "WAY Engineering GmbH",
		teams: ["Brigitte Schulz", "Christian Sailer"],
		positions: ["SE-Team Leiter", "Modul Leiter", "Konstruktor", "Modulplanner"],
		skills: [
			{
				category: "SE-Team Leiter",
				category_skills: ["Boole Tool", "CAD-PDM", "Catia v5", "Freigabeleitstand", "Freigaben", "gAMS", "GSS", "ip3 Terminplan", "ItO Workplace", "KMG/MMG", "LOP", "PEP PDM", "PRISMA", "Projektbedarf", "SKYPE", "TWEN", "TAIS", "PRISMA", "CARISMA", "PQM", "Catia v6"]
			},
			{
				category: "Modul Leiter",
				category_skills: ["AKV", "Baukasten", "Dali & DBV", "DBKR", "Einkaufswagen", "ItO", "Lastenheft", "Lieferant", "Modularbeit", "PMC", "Problemmanagement", "Qualitätsmgmt - Six Sigma - 5W/8D Methode", "Reifegradmanagement", "SBWE", "Virtuelles Gesamtfahrzeug", "Catia v5", "Catia v6", "Prisma", "CAD-PDM", "M-gAMS", "Project Management"]
			},
			{
				category: "Programmierer",
				category_skills: ["Ruby", "Rails", "JavaScript", "HTML", "CSS", "Daten Banken", "Java", "Python", "R", "Visual Basic", "Android", "Swift", "iOS", "Linux", "Active Record", "MySql", "Node.js"]
			},
			{
				category: "Project Management",
				category_skills: ["Leadership", "Team Management", "RPlan", "Microsoft Office Project Management", "Konfliktmanagement", "PLM: Product-Lifecycle-Management"]
			},
			{
				category: "Business Developer",
				category_skills: ["Excel", "Market analyse", "Konkurrenz Analyse", "Visual Basic", "R", "Python", "PowerPoint", "Kunde Betreung", "Messe Erfahrung", "Workshops Vorbereitung"]
			},
			{
				category: "Konstruktor",
				category_skills: ["Catia v5", "Catia v6", "Automotive Erfahrung", "Bauteil Kenntnisse", "Zeichnungen", "Solid Works"]
			},
			{
				category: "Languages",
				category_skills: ["Deutsch", "Englisch", "Spanisch", "Polnisch", "Chinesisch"]
			},
			{
				category: "Karosserie Module",
				category_skills: ["KA: Bodengruppe", "KB: Rohbau, Seitengerippe, Dach", "KC: Dach-, Verdecksysteme, Einfüll-Ladeklappen", "KD: Frontsystem, Kunststoffexterieur, Stossfänger", "KE: Einstieg, Türsystem", "KF: Heckklappe, Front-, Heckscheibe, Reinigungssystem", "KG: Licht, Karosserieelektronik"]
			},
		]
	},
	{
		name: "WAY People+ GmbH",
		teams: ["People A", "People B"],
		positions: ["People Position A", "People Position B", "People Position C", "People Position D", "People Position E",],
		skills: [
			{
				category: "People Category A",
				category_skills: ["Skill A", "Skill B", "Skill C", "Skill D", "Skill E"]
			},
		]
	},
	{
		name: "WAY HR Professionals & Experts GmbH",
		teams: ["Pro Team A", "Pro Team B"],
		positions: ["Pro Pos A", "Pro Pos B", "Pro Pos C", "Pro Pos D"],
		skills: [
			{
				category: "Pro Category B",
				category_skills: ["Skill A", "Skill B", "Skill C", "Skill D", "Skill E"]
			},
		]
	},
	{
		name: "WAY IT Solutions GmbH",
		teams: ["Michael Dreisbach", "Team B"],
		positions: ["System Admin", "Internet Admin", "Servers Admin"],
		skills: [
			{
				category: "IT-Support",
				category_skills: ["Windows Clients 7/10", "Windows Server 2008", "Windows Server 2012", "Android", "iOS", "Microsoft Exchange", "Microsoft SQL", "Virtualisierung VMware", "Virtualisierung HyperV", "IPv4", "IPv6", "Firewalls", "DHCP", "DNS", "VLAN", "Internet-Domains", "DNS Verwaltung", "Email-Workflow", "Antispam"]
			},
		]
	},
]

# create category
i = 1
divisions_hash.each do |division_hash|
	division_hash[:skills].each do |skill|
		category = Category.new(name: skill[:category])
		category.save
		i = i + 1
	end
end

# create company_skill, for every category
divisions_hash.each do |division_hash|
	division_hash[:skills].each do |pair|
		category = Category.where(name: pair[:category])[0]
		category_skills = pair[:category_skills]
		category_skills.each do |category_skill_name|
			company_skill = CompanySkill.new(name: category_skill_name)
			company_skill.category = category
			company_skill.save
		end
	end
end

COUNTRIES = ["Spain", "Germany", "Poland", "Italy", "Greece", "France", "Croatia", "Algeria", "Turkey", "Holland", "Belgium"]

200.times do
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "#{first_name}.#{last_name}@waygroup.de"

	user = User.new(email: email, password: 123456)
	user.save

	# data for profile
	division_hash = divisions_hash.sample
	division_name = division_hash[:name]
	division_team = division_hash[:teams].sample
	division_position = division_hash[:positions].sample

	phone_number = Faker::PhoneNumber.cell_phone

	nationality = COUNTRIES.sample
	birthday = Faker::Date.between(65.years.ago, 18.years.ago)
	startway = Faker::Date.between(12.years.ago, 1.years.ago)
	possibilities = [true, true, true, false, false, false, false, false, false, false].sample
	endway = possibilities ? Faker::Date.between(9.years.ago, 1.months.ago) : ""

	profile = Profile.new(division: division_name, team: division_team, position: division_position, first_name: first_name, last_name: last_name, phone_number: phone_number, nationality: nationality, birthday: birthday, startway: startway, endway: endway)
	profile.user = user
	profile.save

	division_skills = division_hash[:skills]
	division_skills.each do |pair|
		category_skills = pair[:category_skills]
		category_skills.sample(rand(1..3)).to_a.each do |skill_name|
			own_company_skill = OwnCompanySkill.new(name: skill_name)
			categories = Category.where(name: pair[:category])
			categories.each do |category|
				own_company_skill.category = category
				own_company_skill.profile = profile
				own_company_skill.rating = rand(1..3)
				own_company_skill.save
			end
		end
	end

	# employee[:projects].each do |project|
	# 	project = Project.new(title: project[:title], client: project[:client], start: project[:start], finish: project[:finish])
	# 	project.profile = profile
	# 	project.save
	# end
end

# init user
first_name = "albert"
last_name = "montolio"
email = "#{first_name}.#{last_name}@waygroup.de"

user = User.new(email: email, password: email)
user.save

nationality = COUNTRIES.sample
birthday = Faker::Date.between(65.years.ago, 18.years.ago)
startway = Faker::Date.between(12.years.ago, 1.years.ago)
endway = Faker::Date.between(9.years.ago, 1.months.ago)

profile = Profile.new(division: "WAY Engineering GmbH", team: "Brigitte Schulz", position: "SE-Team Leiter", first_name: first_name, last_name: last_name, phone_number: "+494525252", nationality: nationality, birthday: birthday, startway: startway, endway: endway)
profile.user = user
profile.save










