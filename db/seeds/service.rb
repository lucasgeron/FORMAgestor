Service.create(vendor:Vendor.all.sample, degree: Degree.find(53), category: ['WhatsApp', 'Ligação', 'Reunião Online', 'Reunião Presencial','E-mail', 'Assembléia'].sample, 
description: "Atendimento Teste")

40.times do
    p Service.create(
        vendor: Vendor.all.sample, 
        degree: Degree.all.sample, 
        category: ['WhatsApp', 'Ligação', 'Reunião Online', 'Reunião Presencial','E-mail', 'Assembléia'].sample, 
        description: Faker::Lorem.paragraph(sentence_count: 4, supplemental: true) )
end
