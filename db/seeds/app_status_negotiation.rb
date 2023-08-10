

(1..1).each_with_index do |index|


p App::StatusNegotiation.create(client_id: index, name: "Não Mapeado", active: true, style:'fa-regular', icon:'circle', color:'gray')

p App::StatusNegotiation.create(client_id: index, name: "Em Prospecção", active: true, style:'fa-solid', icon:'circle-half-stroke', color:'yellow')

p App::StatusNegotiation.create(client_id: index, name: "Em Negociação", active: true, style:'fa-solid', icon:'circle', color:'blue')

p App::StatusNegotiation.create(client_id: index, name: "Não Existe", active: true, style:'fa-solid', icon:'circle-minus', color:'')

p App::StatusNegotiation.create(client_id: index, name: "Fechado", active: true, style:'fa-solid', icon:'circle', color:'green')

end