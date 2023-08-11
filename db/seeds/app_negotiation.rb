
# GENERATE DEGREE
(1..1).each_with_index do |index|

    for calendar in App::Calendar.by_client(index) do
        for course in App::Course.by_client(index) do     
            
            status = App::StatusNegotiation.by_client(index).to_a
            status << nil
            status = status.sample
        
            if status.nil? 
                vendor = nil 
            elsif (status.present? && status.name == 'Não Existe')
                vendor = nil 
            elsif (status.present? && status.name == 'Fechada')
                company = App::Company.by_client(index).sample 
            else    
                vendor =  App::Vendor.by_client(index).sample
                company = nil
            end

            p App::Negotiation.create(
                client_id: index,
                course: course, 
                calendar: calendar, 
                status: status,
                company: company,
                reference: Faker::Number.number(digits: 5),
                active: true,
                vendor:  vendor
            )    

            puts "---------------"
        end
    end
end