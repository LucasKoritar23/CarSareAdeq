Dado("que esteja tela de cadastro do Sare") do
    AcessaLink.url
    RealizaLogin.acesso(usuario = "deborafl")
    PreencheSare.AcessaSare
    PreencheSare.CadastroInicial(nomeSare = "Projeto GW " +  Faker::Name.first_name)
end
  
Quando("preencher todos os campos do projeto") do
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Jurídica")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Compromissário", tipoPessoa = "Física")
    PreencheSare.Pessoa(nomPessoa = Faker::Name.name , funcaoPessoa = "Representante legal", tipoPessoa = "Física")
    #PreencheSare.DesenhaPropSare
    #PreencheSare.InsereCamposProp
    #PreencheSare.NaoExiste
    #PreencheSare.DesenhaRestauracao
    RealizaLogin.logoff
    RealizaLogin.acesso(usuario = "edgaro")
    PreencheSare.RetornaSare
    PreencheSare.AlteraSituacao(usuario = "edgaro")
    PreencheSare.GeraTermo(usuario = "edgaro" ,tipoTermo = "TCRE")
end
  
Então("o sistema criará o Projeto SARE") do
    numeroSare = find(:id, "ctl00_conteudo_lblNumeroSARE").text
    puts("Projeto: " + numeroSare + " Gerado no link: " + link = (current_url))
end