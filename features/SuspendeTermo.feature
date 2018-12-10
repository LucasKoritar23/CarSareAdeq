#language: pt
#utf-8

@SuspendeTermo

Funcionalidade: Suspender Termo
  Eu como usuario do sistema SARE
  Quero executar um script
  Para criar Termos e deixa-los suspensos

  @tira_print

  Cenario: Suspender Termo após prazo expirado
  	Dado que possua termo na situacao disponível para asssinatura
  	Quando o prazo para assinatura vencer
  	Então o sistema deverá alterar o termo para suspenso