



p company = Company.create(name: "A1", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/a1.png'), filename:'a1.png').to_s
sleep 0.5

p company = Company.create(name: "Brave ", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/brave.png'), filename:'brave.png').to_s
sleep 0.5

p company = Company.create(name: "Cross", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/cross.png'), filename:'cross.png').to_s
sleep 0.5

p company = Company.create(name: "Consoli", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/consoli.png'), filename:'consoli.png').to_s
sleep 0.5

p company = Company.create(name: "Euphoria", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/euphoria.png'), filename:'euphoria.png').to_s
sleep 0.5

p company = Company.create(name: "Formatture", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/formatture.png'), filename:'formatture.png').to_s
sleep 0.5

p company = Company.create(name: "Ticomia", status: true)
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/ticomia.png'), filename:'ticomia.png').to_s
sleep 0.5

p company = Company.create(name: "Voa", status: true)    
p company.to_s + " image attached ? " + company.image.attach(io: File.open('app/assets/images/seed_images/companies/voa.png'), filename:'voa.png').to_s
sleep 0.5