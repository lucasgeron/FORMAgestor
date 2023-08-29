class ClientSetupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
    client = args[0]

    # setup StatusInteraction
    App::StatusInteraction.create(client_id: client.id, name: "Email", active: true, style:'fa-solid', icon:'envelope-open-text', color:'default')
    App::StatusInteraction.create(client_id: client.id, name: "Ligação", active: true, style:'fa-solid', icon:'phone', color:'blue')
    App::StatusInteraction.create(client_id: client.id, name: "Reunião Online", active: true, style:'fa-solid', icon:'video', color:'amber')
    App::StatusInteraction.create(client_id: client.id, name: "Reunião Presencial", active: true, style:'fa-solid', icon:'handshake', color:'purple')
    App::StatusInteraction.create(client_id: client.id, name: "WhatsApp", active: true, style:'fa-brands', icon:'whatsapp', color:'green')
    App::StatusInteraction.create(client_id: client.id, name: "Assembléia", active: true, style:'fa-solid', icon:'check-to-slot', color:'pink')

    # setup StatusNegotiation
    App::StatusNegotiation.create(client_id: client.id, name: "Em Prospecção", active: true, style:'fa-solid', icon:'circle-half-stroke', color:'amber')
    App::StatusNegotiation.create(client_id: client.id, name: "Em Negociação", active: true, style:'fa-solid', icon:'circle', color:'blue')
    App::StatusNegotiation.create(client_id: client.id, name: "Não Existe", active: true, style:'fa-solid', icon:'circle-minus', color:'')
    App::StatusNegotiation.create(client_id: client.id, name: "Fechada", active: true, style:'fa-solid', icon:'circle', color:'green')

    # setup VendorRoles
    App::RoleVendor.create(client_id: client.id, name: "Diretor Comercial", active: true)
    App::RoleVendor.create(client_id: client.id, name: "Representante Comercial", active: true)

    # setup Company
    App::Company.create(client_id: client.id, name: client.name, active: true)

    # setup Calendar
    App::Calendar.create(client_id: client.id, year: Date.today.year, semester: Date.today.month <= 6 ? 1 : 2, active: true)

  end

end
