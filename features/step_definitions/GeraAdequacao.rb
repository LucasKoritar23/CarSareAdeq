Dado("que esteja no CAR com áreas a recompor") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " AdeqAmbiental ",  muni = "ALTAIR")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [769,220,807,475,420,311,769,220])
    PreencheCar.MarcaNaoExiste(artigo = "PRADA")
end
  
Quando("finalizar o CAR") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
end
  
E("preencher todos os campos da adequação ambiental") do
    first("[id*='AdequacaoAmbiental']", visible: true).click
    PreencheAdequacao.CompromissosAnteriores
    PreencheAdequacao.PassivosAmbientais(criaProjeto = "")
    PreencheAdequacao.Finalizar
end
  
Então("o sistema irá gerar CAR com projeto Adequacao") do
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR com Adequação criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end