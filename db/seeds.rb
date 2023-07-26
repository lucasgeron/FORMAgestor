# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p App::Admin.create(email: 'lucasf.geron@gmail.com', password:'123456', password_confirmation:'123456')

p App::Client.create(name: 'Empresa A', cnpj:'00.000.000/0001-00', active: true, licenses: 5)
p App::User.create(email: 'lucasf.geron@gmail.com', password:'123456', password_confirmation:'123456', client_id: 1)
p App::User.create(email: 'a@a', password:'123456', password_confirmation:'123456', client_id: 1)


p App::Client.create(name: 'Empresa B', cnpj:'00.000.000/0001-00', active: true, licenses: 1)
p App::User.create(email: 'a@b', password:'123456', password_confirmation:'123456', client_id: 2)


require 'date'
load Rails.root.join('db', 'seeds', 'app_updates.rb')
