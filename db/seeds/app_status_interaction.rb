

(1..1).each_with_index do |index|



p App::StatusInteraction.create(client_id: index, name: "Email", active: true, style:'fa-solid', icon:'envelope-open-text', color:'default')
p App::StatusInteraction.create(client_id: index, name: "Ligação", active: true, style:'fa-solid', icon:'phone', color:'blue')
p App::StatusInteraction.create(client_id: index, name: "Reunião Online", active: true, style:'fa-solid', icon:'video', color:'amber')
p App::StatusInteraction.create(client_id: index, name: "Reunião Presencial", active: true, style:'fa-solid', icon:'handshake', color:'purple')
p App::StatusInteraction.create(client_id: index, name: "WhatsApp", active: true, style:'fa-brands', icon:'whatsapp', color:'green')
p App::StatusInteraction.create(client_id: index, name: "Assembléia", active: true, style:'fa-solid', icon:'check-to-slot', color:'pink')

end