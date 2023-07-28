

# Degree.create(course: Course.all.sample, semester: Semester.all.sample, status: ['Não Mapeado', 'Em Prospecção', 'Em Negociação', 'Fechado', 'Não Existe'].sample)  

# GENERATE DEGREE
for semester in Semester.all do
    for course in Course.all do     
        @status = ['Não Mapeado', 'Em Prospecção', 'Em Negociação', 'Fechado', 'Não Existe'].sample

        @status == "Fechado" ? @company = Company.all.sample : @company = nil

        p Degree.create(
            course: course, 
            semester: semester, 
                status: @status,
                company: @company,
            budget_num: Faker::Number.number(digits: 5),
            vendor:  @status != "Não Mapeado" && @status != "Não Existe" ? Vendor.all.sample : nil
            
        )    
    end
end