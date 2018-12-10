Dado("que o CAR esteja como Inscrito") do
  AcessaLink.url
  RealizaLogin.acesso(usuario = "55613853720")
  PreencheCar.AcessaCar
  PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " AnaliseParecer ",  muni = "ILHABELA")
  PreencheCar.PessoasAbaDominio
  PreencheCar.AbaDominio_InsereMatricula
  PreencheCar.AbaAnexos
  Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
  PreencheCar.MarcaNaoExiste(artigo = "")
  PreencheCar.AbaFinalizar(possuiAreas = "")
  @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Analise Parecer criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end

Quando("preencher todas as informações da aba Parecer") do
  RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "karinaac")
    PreencheCar.AcessaCarConsultaGerencial
    RealizaBusca.CAR(@numCar)
    AnaliseParecer.IniciaAnalise
    AnaliseParecer.LiberaAbas
    naoAplica = "Não Se Aplica"
    AnaliseParecer.RespInfoBasicas(naoAplica)
    AnaliseParecer.RespLimite(naoAplica)
    AnaliseParecer.App(naoAplica)
    AnaliseParecer.VegetNativa(naoAplica)
    AnaliseParecer.ReservaLegal(naoAplica)
    AnaliseParecer.AdeqFinal(naoAplica)
    AnaliseParecer.Salva
end

Então("o CAR estará disponível para analisar") do
  AnaliseParecer.ConcluiAnalise(@numCar)
end