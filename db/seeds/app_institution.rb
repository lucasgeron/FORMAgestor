(1..1).each_with_index do |index|

    # sleep 0.5

        p @institution =  App::Institution.create(
            client_id: index,
            abreviation: "CESCAGE",
            name: "Centro de Ensino Superior dos Campos Gerais",
            city: App::City.by_client(index).where(name:"Ponta Grossa").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/cescage.png'), 
            filename: 'cescage.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "CESUL",
            name: "Centro Sulamericano de Ensino Superior",
            city: App::City.by_client(index).where(name:"Francisco Beltrão").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/cesul.png'), 
            filename: 'cesul.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "CAMPO REAL",
            name: "Centro Universitário Campo Real",
            city: App::City.by_client(index).where(name:"Laranjeiras do Sul").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/campo_real_unibrasil.png'),
            filename: 'campo_real_unibrasil.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "CAMPO REAL",
            name: "Centro Universitário Campo Real",
            city: App::City.by_client(index).where(name:"Irati").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/campo_real.png'),
            filename: 'campo_real.png'
            ).to_s 
    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "CAMPO REAL",
            name: "Centro Universitário Campo Real",
            city: App::City.by_client(index).where(name:"Guarapuava").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/campo_real.png'),
            filename: 'campo_real.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIVEL",
            name: "Centro Universitário de Cascavel",
            city: App::City.by_client(index).where(name:"Cascavel").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/univel.png'), 
            filename: 'univel.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIDEP",
            name: "Centro Universitário de Pato Branco",
            city: App::City.by_client(index).where(name:"Pato Branco").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unidep.png'), 
            filename: 'unidep.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNIUV",
            name: "Centro Universitário de União da Vitória",
            city: App::City.by_client(index).where(name:"São Mateus do Sul").first())   
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/uniuv.png'), 
            filename: 'uniuv.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNIUV",
            name: "Centro Universitário de União da Vitória",
            city: App::City.by_client(index).where(name:"União da Vitória").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/uniuv.png'), 
            filename: 'uniuv.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "FAG",
            name: "Centro Universitário Fundação Assis Gurgacz",
            city: App::City.by_client(index).where(name:"Toledo").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/fag.png'), 
            filename: 'fag.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "FAG",
            name: "Centro Universitário Fundação Assis Gurgacz",
            city: App::City.by_client(index).where(name:"Cascavel").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/fag.png'), 
            filename: 'fag.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIMATER",
            name: "Centro Universitário Mater Dei",
            city: App::City.by_client(index).where(name:"Pato Branco").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unimater.png'), 
            filename: 'unimater.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNISECAL",
            name: "Centro Universitário Santa Amélia",
            city: App::City.by_client(index).where(name:"Ponta Grossa").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unisecal.png'), 
            filename: 'unisecal.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNISEP",
            name: "Centro Universitário UNISEP - União de Ensino do Sudoeste do Paraná",
            city: App::City.by_client(index).where(name:"Dois Vizinhos").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unisep.png'), 
            filename: 'unisep.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNISEP",
            name: "Centro Universitário UNISEP - União de Ensino do Sudoeste do Paraná",
            city: App::City.by_client(index).where(name:"Francisco Beltrão").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unisep.png'), 
            filename: 'unisep.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIFATEB",
            name: "Faculdade de Telêmaco Borba",
            city: App::City.by_client(index).where(name:"Telêmaco Borba").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unifateb.png'), 
            filename: 'unifateb.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "FATEC",
            name: "Faculdade de Tecnologia do Vale do Ivaí",
            city: App::City.by_client(index).where(name:"Ivaiporã").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/fatec.png'), 
            filename: 'fatec.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "GUARAPUAVA",
            name: "Faculdade Guarapuava",
            city: App::City.by_client(index).where(name:"Guarapuava").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/guarapuava.png'), 
            filename: 'guarapuava.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "FASF",
            name: "Faculdade Sagrada Familia",
            city: App::City.by_client(index).where(name:"Ponta Grossa").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/fasf.png'), 
            filename: 'fasf.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIVALE",
            name: "Faculdades Integradas do Vale do Ivaí",
            city: App::City.by_client(index).where(name:"Ivaiporã").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/univale.png'), 
            filename: 'univale.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "PUC-PR",
            name: "Pontifícia Universidade Católica do Paraná",
            city: App::City.by_client(index).where(name:"Londrina").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/puc-pr.png'), 
            filename: 'puc-pr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "PUC-PR",
            name: "Pontifícia Universidade Católica do Paraná",
            city: App::City.by_client(index).where(name:"Maringá").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/puc-pr.png'), 
            filename: 'puc-pr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "PUC-PR",
            name: "Pontifícia Universidade Católica do Paraná",
            city: App::City.by_client(index).where(name:"Toledo").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/puc-pr.png'), 
            filename: 'puc-pr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIGUAIRACÁ",
            name: "Uniguairacá Centro Universitário",
            city: App::City.by_client(index).where(name:"Prudentópolis").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/uniguairaca.png'), 
            filename: 'uniguairaca.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIGUAIRACÁ",
            name: "Uniguairacá Centro Universitário",
            city: App::City.by_client(index).where(name:"Guarapuava").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/uniguairaca.png'), 
            filename: 'uniguairaca.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICESUMAR",
            name: "Universidade Cesumar",
            city: App::City.by_client(index).where(name:"Londrina").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicesumar.png'), 
            filename: 'unicesumar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICESUMAR",
            name: "Universidade Cesumar",
            city: App::City.by_client(index).where(name:"Ponta Grossa").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicesumar.png'), 
            filename: 'unicesumar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UEPG",
            name: "Universidade Estadual de Ponta Grossa",
            city: App::City.by_client(index).where(name:"Ponta Grossa").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/uepg.png'), 
            filename: 'uepg.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "CEDETEG",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Guarapuava").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/cedeteg.png'), 
            filename: 'cedeteg.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "SANTA CRUZ",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Guarapuava").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICENTRO",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Chopinzinho").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICENTRO",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Coronel Vivida").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICENTRO",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Irati").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICENTRO",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Laranjeiras do Sul").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICENTRO",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Pitanga").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNICENTRO",
            name: "Universidade Estadual do Centro Oeste",
            city: App::City.by_client(index).where(name:"Prudentópolis").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unicentro.png'), 
            filename: 'unicentro.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNIOESTE",
            name: "Universidade Estadual do Oeste do Paraná",
            city: App::City.by_client(index).where(name:"Cascavel").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), 
            filename: 'unioeste.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNIOESTE",
            name: "Universidade Estadual do Oeste do Paraná",
            city: App::City.by_client(index).where(name:"Francisco Beltrão").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), 
            filename: 'unioeste.png'
            ).to_s

    # sleep 0.5

        
        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNIOESTE",
            name: "Universidade Estadual do Oeste do Paraná",
            city: App::City.by_client(index).where(name:"Toledo").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), 
            filename: 'unioeste.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNIOESTE",
            name: "Universidade Estadual do Oeste do Paraná",
            city: App::City.by_client(index).where(name:"Foz do Iguaçu").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unioeste.png'), 
            filename: 'unioeste.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create(
            client_id: index,
            abreviation: "UNESPAR",
            name: "Universidade Estadual do Paraná",
            city: App::City.by_client(index).where(name:"União da Vitória").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unespar.png'), 
            filename: 'unespar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Cascavel").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Cianorte").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Francisco Beltrão").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Guaíra").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Paranavaí").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Toledo").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UNIPAR",
            name: "Universidade Paranaense",
            city: App::City.by_client(index).where(name:"Umuarama").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/unipar.png'), 
            filename: 'unipar.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Apucarana").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Campo Mourão").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Cornélio Procópio").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Curitiba").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Dois Vizinhos").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Francisco Beltrão").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Guarapuava").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Londrina").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Medianeira").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Pato Branco").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Ponta Grossa").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Santa Helena").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

    # sleep 0.5

        p  @institution = App::Institution.create( 
            client_id: index,
            abreviation: "UTFPR",
            name: "Universidade Tecnológica Federal do Paraná",
            city: App::City.by_client(index).where(name:"Toledo").first())
        p @institution.to_s + " image attached ? " + @institution.image.attach(
            io: File.open('app/assets/images/seed_images/institutions/utfpr.png'), 
            filename: 'utfpr.png'
            ).to_s

        end