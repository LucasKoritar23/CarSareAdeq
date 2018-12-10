#language: pt
#utf-8

@GeraRetificacao

Funcionalidade: Gerar Retificação

Eu como usuario do Sare
Quero executar um script
Para criar Retificação

  @tira_print
	
  Cenario: Gerar Retificação
  	Dado que o Projeto Possua Termo Firmado
  	Quando Gestor Gerar a Retificação
  	Então o sistema irá Apresentar a Retificação no Grid