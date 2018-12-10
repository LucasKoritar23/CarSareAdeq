Dado("que possua um CAR com áreas a recompor") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " Prada ",  muni = "CATANDUVA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Importa.Poligono(tipoImportacao = "Propriedade")
    Importa.Poligono(tipoImportacao = "ReservaLegal")
    PreencheCar.MarcaNaoExiste(artigo = "PRADA")
end
  
Quando("finalizar o cadastro do CAR") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
end
  
E("finalizar a adequação ambiental") do
    first("[id*='AdequacaoAmbiental']", visible: true).click
    PreencheAdequacao.CompromissosAnteriores
    PreencheAdequacao.PassivosAmbientais(criaProjeto = "PRADA")
    PreencheAdequacao.Finalizar(tipoFinalizacao = "")
end
  
Então("o sistema irá gerar CAR com projeto PRADA") do
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR com Prada criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end