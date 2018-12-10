Dado("que o {string} esteja como Inscrito e adequacao como Prada") do |numcar|
    AcessaLink.url
    RealizaLogin.acesso(usuario = "55613853720")
    first(".Atendimento", text: "SiCAR/SP", visible: true).click
    RealizaBusca.CarUsuarioExterno(numcar)
    find("[id*='cmdEdita']").click
end
  
  Quando("solicitar alteração no CAR") do
    PreencheCar.SolicitaAlteracao(alteracao = "AreasMapa")
  end
  
  E("alterar areas no Mapa") do
    Desenha.InserePoligono(tipo = 'ReservaLegal_Proposta',  coordenadas = [557,261,575,231,605,263,561,264])
  end
  
  E("Finalizar o CAR") do
    first("[id*='spanFinalizar']").click
    first("[id*='cmdFinaliza']").click
    sleep(2)
    Navegador.verificaPopUp
    Navegador.verificaPopUp
    Navegador.verificaPopUp
    sleep(2)
  end
  
  E("Finalizar a adequacao") do
    first("[id*='AdequacaoAmbiental']", visible: true).click
    sleep(2)
    find("[title='Passivos Ambientais']").click
    find(:link, "Calcular os passivos").click
    Navegador.verificaPopUp
    Navegador.verificaPopUp
    Navegador.verificaPopUp
    PreencheAdequacao.ObtemAreasRecompor
  end
  
  Então("irá alterar as áreas do Sare") do
    find(:link, "Projetos SARE")
    puts("Irá gerar outro Projeto no SARE ao clicar no Finalizar da adequação")
  end