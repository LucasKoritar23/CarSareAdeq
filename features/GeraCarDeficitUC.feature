#language: pt
#utf-8

@GeraCarDeficitUC


Funcionalidade: Gerar CAR
  Eu como usuario do CAR
  Quero executar um script
  Para criar CAR UC

  @tira_print

  Cenario: Criar CAR UC
  	Dado que esteja preenchendo o cadastro do CAR
  	Quando preencher todas as informações requeridas
  	Então o sistema criará o CAR Deficitário de UC