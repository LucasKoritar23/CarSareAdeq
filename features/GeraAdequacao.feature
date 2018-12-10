#language: pt
#utf-8

@GeraAdequacao

Funcionalidade: Gerar Car com Projeto no SARE tipo Adequacao
  Eu como usuario do CAR
  Quero executar um script
  Para criar car com Projeto no SARE tipo Adequacao

  @tira_print

  Cenario: Criar CAR com Adequacao
  	Dado que esteja no CAR com áreas a recompor
  	Quando finalizar o CAR
    E preencher todos os campos da adequação ambiental
  	Então o sistema irá gerar CAR com projeto Adequacao