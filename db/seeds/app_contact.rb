(1..1).each_with_index do |index|
    60.times do
        p App::Contact.create(client_id: index,
                         negotiation: [App::Negotiation.by_client(index).sample, nil].sample, 
                         name: "#{Faker::Name.first_name} #{Faker::Name.middle_name} #{Faker::Name.last_name}", 
                         phone: Faker::PhoneNumber.cell_phone,
                         instagram: Faker::Internet.username,   
                         informant: Faker::Boolean.boolean, 
                         committee: Faker::Boolean.boolean )
    end
end