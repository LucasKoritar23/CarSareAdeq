#language: pt
#utf-8

@GeraCarExcedenteRL

Funcionalidade: Gerar Car Excedente de RL
  Eu como usuario do CAR
  Quero executar um script
  Para criar um car excedente de RL

  @tira_print

  Cenario: Criar CAR Excedente RL
  	Dado que esteja cadastrando o car Excedente de Rl
  	Quando desenhar a Reserva Legal maior que 20%
  	Então o car será Excedente de Reserva Legal