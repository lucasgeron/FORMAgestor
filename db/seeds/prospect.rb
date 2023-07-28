Faker::Config.locale = 'pt-BR'

35.times do

   @course = Course.all.sample

   p Prospect.create( 
      channel: [ 'Evento', 'Redes Sociais', 'Indicação', 'Promoções, Sorteios ou Rifas', 'Universidade'].sample, 
      institution: @course.institution.abreviation,  
      city: City.all.sample.name, 
      course: @course.title, 
      amount: rand(30..70).floor(2).to_s, 
      year_graduation: Semester.all.sample.year.to_s + "." + Semester.all.sample.semester.to_s,  
      vendor: [Vendor.all.sample, nil].sample, 
      name: Faker::Name.name,
      phone: Faker::PhoneNumber.phone_number, 
      instagram: "")
end


# validates :channel, presence: true
# validates :institution, presence: true
# validates :city, presence: true
# validates :course, presence: true
# validates :amount, presence: true
# validates :year_graduation, presence: true
# validates :name, presence: true, length: { minimum: 3, maximum: 50 }
# validates :phone, presence: true, numericality: true, length: { minimum: 10, maximum: 11 } 
