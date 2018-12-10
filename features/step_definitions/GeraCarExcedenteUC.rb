  Dado("que esteja na tela de cadastro do CAR") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
  end
  
  Quando("preencher todas as informações") do
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " Excedente UC ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaDeclaracoes
    PreencheCar.AbaAnexos
  end
  
  E("desenhar o polígono inserido em UC") do
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    #Para Gerar Propriedade Menor que 4 módulos fiscais alterar tipo para "PropriedadeMenor4"
    Desenha.InserePoligono(tipo = "AreaExcedenteUC", coordenadas = [664,236,748,229,753,276,669,283,666,241])
    PreencheCar.MarcaNaoExiste(artigo = "")
  end
  
  Então("o sistema criará o CAR Excedente de UC") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	  puts("CAR Excedente de UC criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
  end