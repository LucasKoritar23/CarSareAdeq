Dado("que possua projeto no Sare") do
    AcessaLink.url
    binding.pry
    RealizaLogin.acesso(usuario = "deborafl")
    PreencheSare.AcessaSare
    PreencheSare.CadastroInicial(nomeSare = "Projeto GW " +  Faker::Name.first_name)
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Jurídica")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Física")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Representante legal", tipoPessoa = "Física")
    @numeroSare = find(:id, "ctl00_conteudo_lblNumeroSARE").text
    puts("Projeto: " + @numeroSare + " Gerado no link: " + link = (current_url))
    RealizaLogin.logoff
end
  
Quando("Gestor Gerar o Termo") do
    RealizaLogin.acesso(usuario = "edgaro")
    PreencheSare.RetornaSare
    PreencheSare.AlteraSituacao(usuario = "karinaac")
    PreencheSare.GeraTermo(usuario = "karinaac" ,tipoTermo = "TCRE")
end
  
E("anexar os documentos") do
    termoGrid = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBSubTermos_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(6)").text
    numTermoConvertido = termoGrid.sub(/TCRE nº /, '')
    SareTermos.AbaArquivos(numTermoConvertido,tipoAnexo = "TermoOrgaoEmissor")
    SareTermos.SituacaoTermo(sitAlterada = "DispAssinatura")
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "deborafl")
    PreencheSare.AcessaMeusProjetos
    RealizaBusca.SareUsuarioExt(@numeroSare)
    SareTermos.AbaArquivos(numTermoConvertido,tipoAnexo = "DisponivelAssinatura")
end
  
Então("o sistema irá firmar o Termo") do
    SareTermos.SituacaoTermo(sitAlterada = "firmado")
end