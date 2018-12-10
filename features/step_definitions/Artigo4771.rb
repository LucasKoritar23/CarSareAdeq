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
    Desenha.InserePoligono(tipo = "PropriedadeMenor4", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [557,261,575,231,605,263,561,264])
    Desenha.InserePoligono(tipo = 'ReservaLegal',    coordenadas = [575,210,577,184,604,201,580,212])
    Desenha.InserePoligono(tipo = 'Vegetacao',     coordenadas = [557,261,575,231,605,263,561,264])
    Desenha.InserePoligono(tipo = 'OutrasApps',    coordenadas = [643,273,665,248,682,283,646,277])
    Desenha.InserePoligono(tipo = 'Vegetacao',     coordenadas = [643,273,665,248,682,283,646,277])
    PreencheCar.MarcaNaoExiste(artigo = "4771")
end
 
Então("o CAR estará disponível com o artigo") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Art4771 criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end