Dado("que esteja criando o CAR") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " Art4771 ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
end

Quando("Desenhar os polígonos para o artigo") do
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    Importa.Poligono(tipoImportacao = "OutrasApps")
    Importa.Poligono(tipoImportacao = "RL_4771")
    Importa.Poligono(tipoImportacao = "VN_4771")
    PreencheCar.MarcaNaoExiste(artigo = "4771")
end
 
Então("o CAR estará disponível com o artigo") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
    puts("CAR Art4771 criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
    first("[id*='AdequacaoAmbiental']", visible: true).click
    PreencheAdequacao.CompromissosAnteriores
    PreencheAdequacao.PassivosAmbientais(criaProjeto = "4771")
    PreencheAdequacao.Finalizar(tipoFinalizacao = "4771")
end