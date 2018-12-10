Dado("que esteja preenchendo o cadastro do CAR") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
end
  
Quando("preencher todas as informações requeridas") do
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " Deficitário UC ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
end
  
Então("o sistema criará o CAR Deficitário de UC") do
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    PreencheCar.MarcaNaoExiste(artigo = "")
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Deficitário de UC criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end