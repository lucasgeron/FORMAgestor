
(1..1).each_with_index do |index|
    for year in 2023..2024 do
        for semester in 1..2 do
            p App::Calendar.create(client_id: index, year: year, semester: semester, active: true)
        end
    end
end