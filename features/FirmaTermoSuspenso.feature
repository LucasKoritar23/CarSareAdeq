#language: pt
#utf-8

@FirmaTermoSuspenso

Funcionalidade: Firmar Termo após ser suspenso
  Eu como usuario do CAR
  Quero executar um script
  Para Firmar o Termo após ser suspenso

  @tira_print

  Cenario: Firmar Termo suspenso
  	Dado que possua projeto no Sare com Termo Suspenso
  	Quando Anexar a justificativa
    E Anexar o Termo Assinado
  	Então o sistema irá alterar a situacao do Termo para Firmado
