

(1..1).each_with_index do |index|
  p App::RoleVendor.create(client_id: index, name: "Representante Comercial", active: true)
  p App::RoleVendor.create(client_id: index, name: "Prospectador", active: true)
end