#language: pt
#utf-8

@GeraCarDeficitRL

Funcionalidade: Gerar Car com Deficit de RL
  Eu como usuario do CAR
  Quero executar um script
  Para criar um car com Deficit de RL

  @tira_print

  Cenario: Criar CAR deficitario RL
  	Dado que esteja cadastrando o car com deficit de Rl
  	Quando desenhar a Reserva Legal menor que 20%
  	Então o car será deficitário de Reserva Legal