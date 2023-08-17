(1..1).each_with_index do |index|
    400.times do
        msg = ''
        rand(1..6).times do 
            msg += Faker::Lorem.paragraph(sentence_count: rand(4..20), supplemental: true) + "\n\n"
        end

        p App::Interaction.create(
            client_id: index,
            vendor: App::Vendor.by_client(index).sample, 
            negotiation: App::Negotiation.by_client(index).sample, 
            status: App::StatusInteraction.by_client(index).sample,
            description: msg
        )
    end
end
