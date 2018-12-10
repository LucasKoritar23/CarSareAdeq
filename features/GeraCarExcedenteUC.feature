#language: pt
#utf-8

@GeraCarExcedenteUC


Funcionalidade: Gerar CAR
  Eu como usuario do CAR
  Quero executar um script
  Para criar CAR UC

  @tira_print

  Cenario: Criar CAR UC
  	Dado que esteja na tela de cadastro do CAR
  	Quando preencher todas as informações
    E desenhar o polígono inserido em UC
  	Então o sistema criará o CAR Excedente de UC