Faker::Config.locale = 'pt-BR'

(1..1).each_with_index do |index|

    5.times do
        p App::Vendor.create(
            name: Faker::Name.first_name + " "+ Faker::Name.last_name, 
            phone: Faker::PhoneNumber.cell_phone, 
            email: Faker::Internet.email, 
            role_id: [App::RoleVendor.by_client(index).sample.id, nil].sample, 
            client_id: index
        )
    end
end