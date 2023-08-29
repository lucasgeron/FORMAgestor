

(1..1).each_with_index do |index|


p App::Company.create(client_id: index, name: "A1", active: true)

p App::Company.create(client_id: index, name: "Brave ", active: true)

p App::Company.create(client_id: index, name: "Cross", active: true)

p App::Company.create(client_id: index, name: "Consoli", active: true)

p App::Company.create(client_id: index, name: "Euphoria", active: true)

p App::Company.create(client_id: index, name: "Formatture", active: true)

p App::Company.create(client_id: index, name: "Ticomia", active: true)

p App::Company.create(client_id: index, name: "Voa", active: true)    

end