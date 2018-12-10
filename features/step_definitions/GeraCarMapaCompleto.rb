Dado("que esteja cadastrando o CAR") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    PreencheCar.AcessaCar
end
  
Quando("preencher todos os campos") do
    PreencheCar.AbaProriedade(nomeCAR = "GW Sitio " + Faker::Name.first_name + " MapaComp ",  muni = "ILHABELA")
    PreencheCar.PessoasAbaDominio
    PreencheCar.AbaDominio_InsereMatricula
    PreencheCar.AbaDeclaracoes
    PreencheCar.AbaAnexos
end
  
E("realizar todos os desenhos") do
    Desenha.InserePoligono(tipo = "Propriedade", coordenadas = [565,354,625,343,623,380,564,359])#prop >4 MF
    Desenha.InserePoligono(tipo = 'ServidaoAdm',   coordenadas = [754,355,769,315,786,346,749,353])
    Desenha.InserePoligono(tipo = 'RiosMais',      coordenadas = [468,216,514,205,513,232,466,219])
    Desenha.InserePoligono(tipo = 'RiosMedia',     coordenadas = [758,237,789,177,832,229,758,241])
    Desenha.InserePoligono(tipo = 'Nascente',      coordenadas = [645,217,665,182,687,223,645,220])
    Desenha.InserePoligono(tipo = 'LagoLagoa',     coordenadas = [781,184,787,154,810,174,782,185])
    Desenha.InserePoligono(tipo = 'OutrosCorpos',  coordenadas = [814,345,815,319,840,341,816,350])
    Desenha.InserePoligono(tipo = 'OutrasApps',    coordenadas = [643,273,665,248,682,283,646,277])
    Desenha.InserePoligono(tipo = 'Vegetacao',     coordenadas = [721,293,730,258,753,293,720,296])
    Desenha.InserePoligono(tipo = 'ReservaLegal',  coordenadas = [557,261,575,231,605,263,561,264])
    Desenha.InserePoligono(tipo = 'Declividade',   coordenadas = [794,368,800,347,832,362,796,371])
    Desenha.InserePoligono(tipo = 'UsoConsolidado',coordenadas = [794,368,800,347,832,362,796,371])
    Desenha.InserePoligono(tipo = 'RLCompensacao', coordenadas = [782,284,797,255,824,281,779,279])
    Desenha.InserePoligono(tipo = 'ServidaoAmb',   coordenadas = [717,208,715,161,758,181,718,211])
    Desenha.InserePoligono(tipo = 'AreaEmUC',      coordenadas = [664,319,644,297,674,297,662,320])
end
  
Então("o sistema criará o CAR completo") do
    PreencheCar.AbaFinalizar(possuiAreas = "")
    @numCar = find(:id, "ctl00_conteudo_lblCAR").text
	puts("CAR Mapa Completo criado com sucesso no link " + link = (current_url) + " e seu número é: " +  @numCar)
end