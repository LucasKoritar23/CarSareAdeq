Dado("que possua CAR Deficitário de UC") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio Vinculado" + Faker::Name.first_name + " Deficitário UC ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    PreencheCar.MarcaNaoExiste(artigo = "")
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCarDeficitUC = find(:id, "ctl00_conteudo_lblCAR").text
	  puts("CAR Deficitário de UC criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCarDeficitUC)
    RealizaLogin.logoff
end
  
  Dado("Excedente de UC") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio Vinculo" + Faker::Name.first_name + " Excedente UC ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaDeclaracoes
    PreencheCar.AbaAnexos
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    #Para Gerar Propriedade Menor que 4 módulos fiscais alterar tipo para "PropriedadeMenor4"
    Desenha.InserePoligono(tipo = "AreaExcedenteUC", coordenadas = [664,236,748,229,753,276,669,283,666,241])
    PreencheCar.MarcaNaoExiste(artigo = "")
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCarExcedenteUC = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Excedente de UC criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCarExcedenteUC)
  end
  
  Quando("realiazar o vínculo de UC") do
    puts("Car Defícitário = " + @numCarDeficitUC)
    puts("Car Excedente = " + @numCarExcedenteUC)
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "marianab")
    PreencheCar.AlteraProcessoAptidao(usuario = "marianab", numCar = @numCarExcedenteUC)
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "55613853720")
    first(".Atendimento", text: "SiCAR/SP", visible: true).click
    RealizaBusca.CarUsuarioExterno(numCar = @numCarExcedenteUC)
    first(:link, "Consultar").click
    PreencheCar.SolicitaAlteracao(alteracao = "UC")
    PreencheCar.VinculaUC(numCarDef = @numCarDeficitUC)
    PreencheCar.AbaFinalizar(possuiAreas = "")
  end
  
  Então("o sistema irá apresentar os CARs UC vinculados") do
    puts("CAR Deficitário: " + @numCarDeficitUC + " vinculado ao CAR: " + @numCarExcedenteUC)        
  end