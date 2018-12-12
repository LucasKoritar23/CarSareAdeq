Dado("que possua projeto no Sare com Termo Suspenso") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "deborafl")
    PreencheSare.AcessaSare
    PreencheSare.CadastroInicial(nomeSare = "Projeto GW " +  Faker::Name.first_name)
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Jurídica")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Física")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Representante legal", tipoPessoa = "Física")
    @numeroSare = find(:id, "ctl00_conteudo_lblNumeroSARE").text
    puts("Projeto: " + @numeroSare + " Gerado no link: " + link = (current_url))
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "edgaro")
    PreencheSare.RetornaSare
    PreencheSare.AlteraSituacao(usuario = "edgaro")
    PreencheSare.GeraTermo(usuario = "edgaro" ,tipoTermo = "TCRE")
    termoGrid = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBSubTermos_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(6)").text
    @numTermoConvertido = termoGrid.sub(/TCRE nº /, '')
    SareTermos.AbaArquivos(@numTermoConvertido,tipoAnexo = "TermoOrgaoEmissor")
    SareTermos.SituacaoTermo(sitAlterada = "DispAssinatura")
    idProjeto = @numeroSare
    ConectaBanco.acesso
    ConectaBanco.alteraPrazoAssinatura(idProjeto)
    RealizaLogin.logoff
    ExecutaRobo.SuspendeTermo
    AcessaLink.url
    RealizaLogin.acesso(usuario = "deborafl")
    PreencheSare.AcessaMeusProjetos
    RealizaBusca.SareUsuarioExt(@numeroSare)
    SareTermos.SituacaoTermo(sitAlterada = "suspenso")
  end
  
  Quando("Anexar a justificativa") do
    SareTermos.AbaArquivos(@numTermoConvertido,tipoAnexo = "JustificativaTermo")
  end
  
  E("Anexar o Termo Assinado") do
    SareTermos.AbaArquivos(@numTermoConvertido,tipoAnexo = "DisponivelAssinatura")
  end
  
  Então("o sistema irá alterar a situacao do Termo para Firmado") do
    SareTermos.SituacaoTermo(sitAlterada = "firmado")
  end