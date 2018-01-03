# it, engineering, people plus, 
skills = [
	{
		category: "SE-Team Leiter",
		category_skills: ["Boole Tool", "CAD-PDM", "Catia v5", "Freigabeleitstand", "Freigaben", "gAMS", "GSS", "ip3 Terminplan", "ItO Workplace", "KMG/MMG", "LOP", "PEP PDM", "PRISMA", "Projektbedarf", "SKYPE", "TWEN", "TAIS", "PRISMA", "CARISMA", "PQM", "Catia v6"]
	},
	{
		category: "Modul Leiter",
		category_skills: ["AKV", "Baukasten", "Dali & DBV", "DBKR", "Einkaufswagen", "ItO", "Lastenheft", "Lieferant", "Modularbeit", "PMC", "Problemmanagement", "Qualitätsmgmt - Six Sigma - 5W/8D Methode", "Reifegradmanagement", "SBWE", "Virtuelles Gesamtfahrzeug", "Catia v5", "Prisma", "CAD-PDM", "M-gAMS", "Project Management"]
	},
	{
		category: "IT-Support",
		category_skills: ["Windows Clients 7/10", "Windows Server 2008", "Windows Server 2012", "Android", "iOS", "Microsoft Exchange", "Microsoft SQL", "Virtualisierung VMware", "Virtualisierung HyperV", "IPv4", "IPv6", "Firewalls", "DHCP", "DNS", "VLAN", "Internet-Domains", "DNS Verwaltung", "Email-Workflow", "Antispam"]
	},
	{
		category: "Progammierer",
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

skills.each do |skill_info|
	category = Category.create(name: skill_info[:category])
	skill_info[:category_skills].each do |skill|
		skill = CompanySkill.new(name: skill)
		skill.category = category
		skill.save
	end
end


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
		document: "image/upload/v1514324187/edzm3iz0vfzn3fte8vw6.pdf",
		own_company_skills: [
			{
				category: "Progammierer",
				names: ["Ruby", "Rails", "JavaScript", "HTML", "CSS", "Active Record"]
			},
			{
				category: "SE-Team Leiter",
				names: ["Boole Tool", "CAD-PDM", "Catia v5", "Freigabeleitstand"],
			}
		],
		projects: [
			{
				title: "SE-Team Leiter i15 Türen",
				client: "BMW Group",
				start: Date.new(2016,1,2),
				finish: Date.new(2017,12,20),
			},
			{
				title: "Business Developer Carbon Fiber parts",
				client: "Carbures Group",
				start: Date.new(2015,4,12),
				finish: Date.new(2016,1,2),
			},
			{
				title: "Entwicklungsingenieur Karrosserie Lkvs",
				client: "MAN AG",
				start: Date.new(2014,3,22),
				finish: Date.new(2015,4,12),
			},
			{
				title: "Berechnungssingenieur",
				client: "BMW AG",
				start: Date.new(2011,1,1),
				finish: Date.new(2014,3,22),
			},
			{
				title: "Berechnungssingenieur",
				client: "Altran",
				start: Date.new(2010,3,10),
				finish: Date.new(2011,1,1),
			},
			{
				title: "Berechnungssingenieur",
				client: "IndustrieHansa",
				start: Date.new(2009,6,16),
				finish: Date.new(2010,3,10),
			},
			{
				title: "Praktikum Project Management, Planning",
				client: "Daimler AG",
				start: Date.new(2008,7,20),
				finish: Date.new(2009,6,16),
			},
			{
				title: "Master Thesis: Finite Elemente Method. Struktur Berechnung",
				client: "Universität Stuttgart",
				start: Date.new(2008,7,20),
				finish: Date.new(2009,6,16),
			}
		],
	},
	{
		email: "alexander.kir@waygroup.de",
		password: "alexander.kir@waygroup.de",
		division: "Engineering",
		team: "TBD",
		first_name: "Alexander",
		last_name: "Kir",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [
			
		],
		projects: [
			
		],
	},
	{
		email: "alois.stein@waygroup.de",
		password: "alois.stein@waygroup.de",
		division: "Personal Wesen",
		team: "Brigitte Schulz",
		first_name: "Alois",
		last_name: "Stein",
		phone_number: "TBD",
		position: "Recruiter",
		title: "TBD",
		own_company_skills: [
			{
				category: "Karosserie Module",
				names: ["KD: Frontsystem, Kunststoffexterieur, Stossfänger", "KF: Heckklappe, Front-, Heckscheibe, Reinigungssystem", "KA: Bodengruppe", "KB: Rohbau, Seitengerippe, Dach", "KC: Dach-, Verdecksysteme, Einfüll-Ladeklappen"]
			},
			{
				category: "SE-Team Leiter",
				names: ["gAMS", "PQM"],
			}
		],
		projects: [
			
		],
	},
	{
		email: "alvaro.leal@waygroup.de",
		password: "alvaro.leal@waygroup.de",
		division: "Engineering",
		team: "Brigitte Schulz",
		first_name: "Alvaro",
		last_name: "Leal",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		document: "image/upload/v1514369271/linda_rinaldi_ez8iyl.pdf",
		own_company_skills: [
			{
				category: "Project Management",
				names: ["PLM: Product-Lifecycle-Management"]
			},
			{
				category: "Konstruktor",
				names: ["Catia v5", "Catia v6"],
			}
		],
		projects: [],
	},
	{
		email: "anas.mnif@waygroup.de",
		password: "anas.mnif@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "Anas",
		last_name: "Mnif",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "andre.kolks@waygroup.de",
		password: "andre.kolks@waygroup.de",
		division: "Engineering",
		team: "Christian Sailer",
		first_name: "Andre",
		last_name: "Kolks",
		phone_number: "TBD",
		position: "Modul Leiter",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "andreas.hauswald@waygroup.de",
		password: "andreas.hauswald@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "anke.gradl@waygroup.de",
		password: "anke.gradl@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "anton.sapronov@waygroup.de",
		password: "anton.sapronov@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "beyrem.amor@waygroup.de",
		password: "beyrem.amor@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "brigitte.schulz@waygroup.de",
		password: "brigitte.schulz@waygroup.de",
		division: "Engineering",
		team: "Brigitte Schulz",
		first_name: "Brigitte",
		last_name: "Schulz",
		phone_number: "TBD",
		position: "Prokuristin",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "carolin.mumm@waygroup.de",
		password: "carolin.mumm@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "christian.sailer@waygroup.de",
		password: "christian.sailer@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
	{
		email: "christoph.pincemin@waygroup.de",
		password: "christoph.pincemin@waygroup.de",
		division: "TBD",
		team: "TBD",
		first_name: "TBD",
		last_name: "TBD",
		phone_number: "TBD",
		position: "TBD",
		title: "TBD",
		own_company_skills: [],
		projects: [],
	},
]

employees.each do |employee|
	user = User.new(email: employee[:email], password: employee[:password])
	user.save

	profile = Profile.new(division: employee[:division], team: employee[:team], first_name: employee[:first_name], last_name: employee[:last_name], phone_number: employee[:phone_number], position: employee[:position])
	profile.user = user
	profile.save

	employee[:own_company_skills].each do |pair|
		pair[:names].each do |name|
			own_company_skill = OwnCompanySkill.new(name: name)
			category = Category.where(name: pair[:category])[0]
			own_company_skill.category = category
			own_company_skill.profile = profile
			own_company_skill.rating = rand(1..3)
			own_company_skill.save
		end
	end

	employee[:projects].each do |project|
		project = Project.new(title: project[:title], client: project[:client], start: project[:start], finish: project[:finish])
		project.profile = profile
		project.save
	end
end














