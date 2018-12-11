Dado("que possua o CAR ser areas a recompor") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " Artigo 68 ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    PreencheCar.MarcaNaoExiste(artigo = "")
    PreencheCar.AbaFinalizar(possuiAreas = "")
  end
  
  Quando("preencher os campos da adequação") do
    PreencheAdequacao.CompromissosAnteriores
    PreencheAdequacao.PassivosAmbientais(criaProjeto = "PRADA")
  end
  
  E("solicitar a dipensa atraves do {int}") do |int|
    PreencheAdequacao.Solicita68
  end
  
  E("finalizar a adequação") do
    PreencheAdequacao.Finalizar(tipoFinalizacao = "68")
  end
  
  Então("o car terá solicitado ao {int}") do |int|
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR solicitado 68 criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
  end