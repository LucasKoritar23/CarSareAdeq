Dado("que esteja cadastrando o car Excedente de Rl") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " PreProd ",  muni = "NOVAIS")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    #Importa.Poligono(tipoImportacao = "Propriedade")
    #Importa.Poligono(tipoImportacao = "ReservaLegal")
    
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [769,220,807,475,420,311,769,220])
    #Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [557,261,575,231,605,263,561,264])
  end
  
  Quando("desenhar a Reserva Legal maior que {int}%") do |int|
    #Importa.Poligono(tipoImportacao = "RLCompensacao")
    #Importa.Poligono(tipoImportacao = "ServidaoAmb")
    PreencheCar.MarcaNaoExiste(artigo = "Exc_RL")
  end
  
  Então("o car será Excedente de Reserva Legal") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	  puts("CAR Excedente de RL criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
    first("[id*='AdequacaoAmbiental']", visible: true).click
    PreencheAdequacao.CompromissosAnteriores
    PreencheAdequacao.PassivosAmbientais(criaProjeto = "PRADA")
    PreencheAdequacao.Finalizar
  end