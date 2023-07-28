Faker::Config.locale = 'pt-BR'

Student.create(name: "Lucas Fernando Geron", phone: "46999220095", instagram: "oolucasfernando",   informant: true, comission: true )

55.times do
    p Student.create(degree: Degree.all.sample, name: Faker::Name.name_with_middle, phone: Faker::PhoneNumber.cell_phone, instagram: "",   informant: Faker::Boolean.boolean, comission: Faker::Boolean.boolean )
end