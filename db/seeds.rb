
load Rails.root.join('db', 'seeds', 'app_updates.rb')


p App::Client.create(name: 'FORMAgestor', cnpj:'00.000.000/0000-00', active: true, licenses: 5)
p App::Client.create(name: 'Empresa A', cnpj:'00.000.000/0001-00', active: true, licenses: 3)
p App::Client.create(name: 'Empresa B', cnpj:'00.000.000/0001-00', active: true, licenses: 2)


p App::Admin.create(email: 'lucasf.geron@gmail.com', password:'123456', password_confirmation:'123456', client_id: 1)
p App::User.create(email: 'lucasf.geron@gmail.com', password:'123456', password_confirmation:'123456', client_id: 1)

p App::User.create(email: 'a@a', password:'123456', password_confirmation:'123456', client_id: 2)
p App::User.create(email: 'b@a', password:'123456', password_confirmation:'123456', client_id: 2)

p App::User.create(email: 'a@b', password:'123456', password_confirmation:'123456', client_id: 3)
p App::User.create(email: 'b@b', password:'123456', password_confirmation:'123456', client_id: 3)


load Rails.root.join('db', 'seeds', 'app_city.rb')
load Rails.root.join('db', 'seeds', 'app_institution.rb')
load Rails.root.join('db', 'seeds', 'app_course.rb')
load Rails.root.join('db', 'seeds', 'app_calendar.rb')
load Rails.root.join('db', 'seeds', 'app_company.rb')
load Rails.root.join('db', 'seeds', 'app_status_negotiation.rb')
load Rails.root.join('db', 'seeds', 'app_status_interaction.rb')
load Rails.root.join('db', 'seeds', 'app_vendor.rb')


load Rails.root.join('db', 'seeds', 'app_negotiation.rb')

load Rails.root.join('db', 'seeds', 'app_interaction.rb')
load Rails.root.join('db', 'seeds', 'app_prospect.rb')
load Rails.root.join('db', 'seeds', 'app_contact.rb')

