#language: pt
#utf-8

@VinculaCarRL

Funcionalidade: Vincular CAR com Deficit de RL em um CAR excedente
  Eu como usuario do CAR
  Quero executar um script
  Para vincular o car deficitário no excedente

  @tira_print

  Cenario: Vincular Car deficitário no excedente
  	Dado que possua um CAR deficitário
	  E um CAR Excedente
  	Quando realizar o vínculo
  	Então o CAR deficitario estará vinculado ao excedente