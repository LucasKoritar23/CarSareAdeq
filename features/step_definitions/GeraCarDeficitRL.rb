Dado("que esteja cadastrando o car com deficit de Rl") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "03416907833")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " Deficitário RL ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
end
  
Quando("desenhar a Reserva Legal menor que {int}%") do |int|
    Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [557,261,575,231,605,263,561,264])
    PreencheCar.MarcaNaoExiste(artigo = "Def_RL")
    PreencheCar.AbaFinalizar(possuiAreas = "")
end
  
Então("o car será deficitário de Reserva Legal") do
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Deficitário de RL criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end