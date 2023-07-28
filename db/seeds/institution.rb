sleep 0.5

    p @institution =  Institution.create(abreviation: "CESCAGE", name: "Centro de Ensino Superior dos Campos Gerais", title: "Centro de Ensino Superior dos Campos Gerais", city: City.where(name:"Ponta Grossa").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/cescage.png'), filename: 'cescage.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "CESUL", name: "Centro Sulamericano de Ensino Superior", title: "Centro Sulamericano de Ensino Superior", city: City.where(name:"Francisco Beltrão").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/cesul.png'), filename: 'cesul.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "CAMPO REAL", name: "Centro Universitário Campo Real", title: "Centro Universitário Campo Real - Campus LDS", city: City.where(name:"Laranjeiras do Sul").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/campo_real_unibrasil.png'),filename: 'campo_real_unibrasil.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "CAMPO REAL", name: "Centro Universitário Campo Real", title: "Centro Universitário Campo Real - Campus Irati", city: City.where(name:"Irati").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/campo_real.png'),filename: 'campo_real.png').to_s 
sleep 0.5

    p  @institution = Institution.create( abreviation: "CAMPO REAL", name: "Centro Universitário Campo Real", title: "Centro Universitário Campo Real", city: City.where(name:"Guarapuava").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/campo_real.png'),filename: 'campo_real.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIVEL", name: "Centro Universitário de Cascavel", title: "Centro Universitário de Cascavel", city: City.where(name:"Cascavel").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/univel.png'), filename: 'univel.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIDEP", name: "Centro Universitário de Pato Branco", title: "Centro Universitário de Pato Branco", city: City.where(name:"Pato Branco").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unidep.png'), filename: 'unidep.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIUV", name: "Centro Universitário de União da Vitória", title: "Centro Universitário de União da Vitória - Campus São Mateus do Sul", city: City.where(name:"São Mateus do Sul").first())   
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/uniuv.png'), filename: 'uniuv.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIUV", name: "Centro Universitário de União da Vitória", title: "Centro Universitário de União da Vitória - Campus União da Vitória", city: City.where(name:"União da Vitória").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/uniuv.png'), filename: 'uniuv.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "FAG", name: "Centro Universitário Fundação Assis Gurgacz", title: "Centro Universitário Fundação Assis Gurgacz - Campus Toledo", city: City.where(name:"Toledo").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/fag.png'), filename: 'fag.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "FAG", name: "Centro Universitário Fundação Assis Gurgacz", title: "Centro Universitário Fundação Assis Gurgacz - Campus Cascavel", city: City.where(name:"Cascavel").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/fag.png'), filename: 'fag.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIMATER", name: "Centro Universitário Mater Dei", title: "Centro Universitário Mater Dei", city: City.where(name:"Pato Branco").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unimater.png'), filename: 'unimater.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNISECAL", name: "Centro Universitário Santa Amélia", title: "Centro Universitário Santa Amélia - Campus Ponta Grossa", city: City.where(name:"Ponta Grossa").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unisecal.png'), filename: 'unisecal.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNISEP", name: "Centro Universitário UNISEP - União de Ensino do Sudoeste do Paraná", title: "Centro Universitário UNISEP - União de Ensino do Sudoeste do Paraná - Campus Dois Vizinhos", city: City.where(name:"Dois Vizinhos").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unisep.png'), filename: 'unisep.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNISEP", name: "Centro Universitário UNISEP - União de Ensino do Sudoeste do Paraná", title: "Centro Universitário UNISEP - União de Ensino do Sudoeste do Paraná - Campus Francisco Beltrão", city: City.where(name:"Francisco Beltrão").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unisep.png'), filename: 'unisep.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIFATEB", name: "Faculdade de Telêmaco Borba", title: "Faculdade de Telêmaco Borba", city: City.where(name:"Telêmaco Borba").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unifateb.png'), filename: 'unifateb.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "FATEC", name: "Faculdade de Tecnologia do Vale do Ivaí", title: "Faculdade de Tecnologia do Vale do Ivaí - Campus Ivaiporã", city: City.where(name:"Ivaiporã").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/fatec.png'), filename: 'fatec.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "FACULDADE GUARAPUAVA", name: "Faculdade Guarapuava", title: "Faculdade Guarapuava", city: City.where(name:"Guarapuava").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/guarapuava.png'), filename: 'guarapuava.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "FASF", name: "Faculdade Sagrada Familia", title: "Faculdade Sagrada Familia", city: City.where(name:"Ponta Grossa").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/fasf.png'), filename: 'fasf.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIVALE", name: "Faculdades Integradas do Vale do Ivaí", title: "Faculdades Integradas do Vale do Ivaí - Campus Ivaiporã", city: City.where(name:"Ivaiporã").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/univale.png'), filename: 'univale.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "PUC-PR", name: "Pontifícia Universidade Católica do Paraná", title: "Pontifícia Universidade Católica do Paraná - Campus Londrina - Campus Londrina", city: City.where(name:"Londrina").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/puc-pr.png'), filename: 'puc-pr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "PUC-PR", name: "Pontifícia Universidade Católica do Paraná", title: "Pontifícia Universidade Católica do Paraná - Campus Maringá - Campus Maringá", city: City.where(name:"Maringá").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/puc-pr.png'), filename: 'puc-pr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "PUC-PR", name: "Pontifícia Universidade Católica do Paraná", title: "Pontifícia Universidade Católica do Paraná - Campus Toledo - Campus Toledo", city: City.where(name:"Toledo").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/puc-pr.png'), filename: 'puc-pr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIGUAIRACÁ", name: "Uniguairacá Centro Universitário", title: "Uniguairacá Centro Universitário - Campus Prudentópolis", city: City.where(name:"Prudentópolis").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/uniguairaca.png'), filename: 'uniguairaca.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIGUAIRACÁ", name: "Uniguairacá Centro Universitário", title: "Uniguairacá Centro Universitário", city: City.where(name:"Guarapuava").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/uniguairaca.png'), filename: 'uniguairaca.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICESUMAR", name: "Universidade Cesumar", title: "Universidade Cesumar - Campus Londrina", city: City.where(name:"Londrina").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicesumar.png'), filename: 'unicesumar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICESUMAR", name: "Universidade Cesumar", title: "Universidade Cesumar - Campus Ponta Grossa", city: City.where(name:"Ponta Grossa").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicesumar.png'), filename: 'unicesumar.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UEPG", name: "Universidade Estadual de Ponta Grossa", title: "Universidade Estadual de Ponta Grossa", city: City.where(name:"Ponta Grossa").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/uepg.png'), filename: 'uepg.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "CEDETEG", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Cedeteg", city: City.where(name:"Guarapuava").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/cedeteg.png'), filename: 'cedeteg.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "SANTA CRUZ", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Santa Cruz", city: City.where(name:"Guarapuava").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICENTRO", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Chopinzinho", city: City.where(name:"Chopinzinho").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICENTRO", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Coronel Vivida", city: City.where(name:"Coronel Vivida").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICENTRO", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Irati", city: City.where(name:"Irati").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICENTRO", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Laranjeiras do Sul", city: City.where(name:"Laranjeiras do Sul").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICENTRO", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Pitanga", city: City.where(name:"Pitanga").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNICENTRO", name: "Universidade Estadual do Centro Oeste", title: "Universidade Estadual do Centro Oeste - Campus Prudentópolis", city: City.where(name:"Prudentópolis").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), filename: 'unicentro.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIOESTE", name: "Universidade Estadual do Oeste do Paraná", title: "Universidade Estadual do Oeste do Paraná - Campus Cascavel", city: City.where(name:"Cascavel").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), filename: 'unioeste.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIOESTE", name: "Universidade Estadual do Oeste do Paraná", title: "Universidade Estadual do Oeste do Paraná - Campus Francisco Beltrão", city: City.where(name:"Francisco Beltrão").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), filename: 'unioeste.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIOESTE", name: "Universidade Estadual do Oeste do Paraná", title: "Universidade Estadual do Oeste do Paraná - Campus Marechal Cândido Rondon", city: City.where(name:"Marechal Cândido Rondon").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), filename: 'unioeste.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIOESTE", name: "Universidade Estadual do Oeste do Paraná", title: "Universidade Estadual do Oeste do Paraná - Campus Toledo", city: City.where(name:"Toledo").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), filename: 'unioeste.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNIOESTE", name: "Universidade Estadual do Oeste do Paraná", title: "Universidade Estadual do Oeste do Paraná - Campus Foz do Iguaçu", city: City.where(name:"Foz do Iguaçu").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), filename: 'unioeste.png').to_s

sleep 0.5

    p  @institution = Institution.create(abreviation: "UNESPAR", name: "Universidade Estadual do Paraná", title: "Universidade Estadual do Paraná - Campus União da Vitória", city: City.where(name:"União da Vitória").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unespar.png'), filename: 'unespar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Cascavel", city: City.where(name:"Cascavel").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Cianorte", city: City.where(name:"Cianorte").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Francisco Beltrão", city: City.where(name:"Francisco Beltrão").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Guaíra", city: City.where(name:"Guaíra").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Paranavaí", city: City.where(name:"Paranavaí").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Toledo", city: City.where(name:"Toledo").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UNIPAR", name: "Universidade Paranaense", title: "Universidade Paranaense - Campus Umuarama", city: City.where(name:"Umuarama").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/unipar.png'), filename: 'unipar.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Apucarana", city: City.where(name:"Apucarana").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Campo Mourão", city: City.where(name:"Campo Mourão").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Cornélio Procópio", city: City.where(name:"Cornélio Procópio").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Curitiba", city: City.where(name:"Curitiba").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Dois Vizinhos", city: City.where(name:"Dois Vizinhos").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Francisco Beltrão", city: City.where(name:"Francisco Beltrão").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Guarapuava", city: City.where(name:"Guarapuava").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Londrina", city: City.where(name:"Londrina").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Medianeira", city: City.where(name:"Medianeira").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Pato Branco", city: City.where(name:"Pato Branco").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Ponta Grossa", city: City.where(name:"Ponta Grossa").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Santa Helena", city: City.where(name:"Santa Helena").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s

sleep 0.5

    p  @institution = Institution.create( abreviation: "UTFPR", name: "Universidade Tecnológica Federal do Paraná", title: "Universidade Tecnológica Federal do Paraná - Campus Toledo", city: City.where(name:"Toledo").first())
    p @institution.to_s + " image attached ? " + @institution.image.attach(io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), filename: 'utfpr.png').to_s