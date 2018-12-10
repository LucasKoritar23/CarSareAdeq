#language: pt
#utf-8

@GeraCarPassivos


Funcionalidade: Gerar CAR para Passivos
  Eu como usuario do CAR
  Quero executar um script
  Para criar car com os polígonos de Passívos

  @tira_print

  Cenario: Gerar Car Passivos
  	Dado que esteja no cadastro do CAR
  	Quando preencher os dados padroes
    E criar todos os desenhos
  	Então o sistema criará o CAR com Passivos