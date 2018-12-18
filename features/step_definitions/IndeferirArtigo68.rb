Dado("o car tenha solicitado o artigo {int}") do |int|
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
    PreencheAdequacao.CompromissosAnteriores
    PreencheAdequacao.PassivosAmbientais(criaProjeto = "PRADA")
    PreencheAdequacao.Solicita68
    PreencheAdequacao.Finalizar(tipoFinalizacao = "68")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
    puts("CAR solicitado 68 criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
  end
  
  Quando("o usuario SAA indeferir o {int}") do |int|
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "karinaac")
    PreencheCar.AcessaCarConsultaGerencial
    RealizaBusca.CAR(@numCar)
    PreencheAdequacao.Analisa68(resultadoAnalise = "Indeferido")
  end
  
  Então("a situação da AA irá para Aguarda Proposta de Reserva Legal") do
    sitCAR = find("[id*='lblSituacao']", match: :first).text
    puts("A situação do CAR foi alterada para: " + sitCAR)
    sitAA = find("[id*='lblSituacaoAdequacao']", match: :first).text
    puts("A situação da adequação foi alterada para: " + sitAA)
  end