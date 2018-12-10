Dado("que possua termo na situacao disponível para asssinatura") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "03416907833")
    PreencheSare.AcessaSare
    PreencheSare.CadastroInicial(nomeSare = "Projeto GW " +  Faker::Name.first_name)
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Jurídica")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Física")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Representante legal", tipoPessoa = "Física")
    @numeroSare = find(:id, "ctl00_conteudo_lblNumeroSARE").text
    puts("Projeto: " + @numeroSare + " Gerado no link: " + link = (current_url))
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "karinaac")
    PreencheSare.RetornaSare
    PreencheSare.AlteraSituacao(usuario = "karinaac")
    PreencheSare.GeraTermo(usuario = "karinaac" ,tipoTermo = "TCRE")
    termoGrid = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBSubTermos_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(6)").text
    numTermoConvertido = termoGrid.sub(/TCRE nº /, '')
    SareTermos.AbaArquivos(numTermoConvertido,tipoAnexo = "TermoOrgaoEmissor")
    SareTermos.SituacaoTermo(sitAlterada = "DispAssinatura")
  end
  
Quando("o prazo para assinatura vencer") do
    idProjeto = @numeroSare
    ConectaBanco.acesso
    ConectaBanco.alteraPrazoAssinatura(idProjeto)
end
  
Então("o sistema deverá alterar o termo para suspenso") do
    RealizaLogin.logoff
    ExecutaRobo.SuspendeTermo
    AcessaLink.url
    RealizaLogin.acesso(usuario = "03416907833")
    PreencheSare.AcessaMeusProjetos
    RealizaBusca.SareUsuarioExt(@numeroSare)
    SareTermos.SituacaoTermo(sitAlterada = "suspenso")
end