Dado("que o Projeto Possua Termo Firmado") do
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
    numTermoConvertido = termoGrid.sub(/TCRE nº /, '')
    SareTermos.AbaArquivos(numTermoConvertido,tipoAnexo = "TermoOrgaoEmissor")
    SareTermos.SituacaoTermo(sitAlterada = "DispAssinatura")
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "deborafl")
    PreencheSare.AcessaMeusProjetos
    RealizaBusca.SareUsuarioExt(@numeroSare)
    SareTermos.AbaArquivos(numTermoConvertido,tipoAnexo = "DisponivelAssinatura")
    SareTermos.SituacaoTermo(sitAlterada = "firmado")
end
  
  Quando("Gestor Gerar a Retificação") do
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "edgaro")
    PreencheSare.RetornaSare
    SareRetificacao.GeraRetificacao
  end
  
  Então("o sistema irá Apresentar a Retificação no Grid") do
    SareRetificacao.SituacaoRetificacao(sitAlterada = "RetificacaoOrgaoEmissor")
  end