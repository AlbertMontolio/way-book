albert = User.new(email: "albert.montolio@gmail.com", password: "albert.montolio@gmail.com")
albert.save

profile = Profile.new
profile.user = albert
profile.save

CATEGORIES = %('SE-Team Leiter' 'Modul Leiter' Sales Programmierer 'Project Manager' 'Business Developer' Konstruktur)

p CATEGORIES

