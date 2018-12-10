#language: pt
#utf-8

@GeraPrada

Funcionalidade: Gerar Car com Projeto no SARE tipo Prada
  Eu como usuario do CAR
  Quero executar um script
  Para criar car com Projeto no SARE tipo Prada

  @tira_print

  Cenario: Criar CAR com Prada
  	Dado que possua um CAR com áreas a recompor
  	Quando finalizar o cadastro do CAR
    E finalizar a adequação ambiental
  	Então o sistema irá gerar CAR com projeto PRADA