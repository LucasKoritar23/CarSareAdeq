Dado("que possua um CAR deficitário") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "03416907833")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio Vinculado " + Faker::Name.first_name + " Deficitário RL ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [557,261,575,231,605,263,561,264])
    PreencheCar.MarcaNaoExiste(artigo = "Def_RL")
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCarDeficitario = find(:id, "ctl00_conteudo_lblCAR").text
    puts("CAR Deficitário de RL criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCarDeficitario)
    PreencheAdequacao.ObtemDeficit
    RealizaLogin.logoff
end
  
E("um CAR Excedente") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio Vinculo " + Faker::Name.first_name + " Excedente RL ",  muni = "ALTAIR")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaAnexos
    Importa.Poligono(tipoImportacao = "Propriedade")
    Importa.Poligono(tipoImportacao = "ReservaLegal")
    Importa.Poligono(tipoImportacao = "RLCompensacao")
    Importa.Poligono(tipoImportacao = "ServidaoAmb")
    PreencheCar.MarcaNaoExiste(artigo = "Exc_RL")
    PreencheCar.AbaFinalizar(possuiAreas = "RL")
    @numCarExcedente = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Excedente de RL criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCarExcedente)
end
  
Quando("realizar o vínculo") do
    PreencheCar.SolicitaAlteracao(alteracao = "")
    PreencheCar.VinculaCAR(numCarDeficitario = @numCarDeficitario)
end
  
Então("o CAR deficitario estará vinculado ao excedente") do
    puts("O car deficitário de número " + @numCarDeficitario + " foi vinculado no car Excedente: " + @numCarExcedente)
end