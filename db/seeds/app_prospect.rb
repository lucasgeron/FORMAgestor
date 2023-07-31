Faker::Config.locale = 'pt-BR'

(1..3).each_with_index do |index|

   35.times do
      p App::Prospect.create( 
         client_id: index,
         channel: [ 'Evento', 'Redes Sociais', 'Indicação', 'Promoções, Sorteios ou Rifas', 'Universidade'].sample, 
         institution: Faker::University.name,  
         city: ConectaAddressBr::Cities.all_single.sample, 
         course: Faker::Educator.course_name, 
         amount: rand(30..70).floor(2).to_s, 
         year_graduation: rand(2024..2026).to_s + "." + rand(1..2).to_s,  
         vendor: [App::Vendor.by_client(index).sample, nil].sample, 
         name: Faker::Name.name,
         phone: Faker::PhoneNumber.phone_number, 
         instagram: "@" + Faker::Internet.username)
   end
end
