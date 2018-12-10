#language: pt
#utf-8

@SuspendeRetificacao

Funcionalidade: Suspender Retificacao
  Eu como usuario do sistema SARE
  Quero executar um roteiro automatizado
  Para Suspender Retificacao

  @tira_print

    Cenario: Suspender Retificação
  	Dado que possua Retificacao na situacao Aguarda Assinatura
  	Quando o Prazo de Assinatura do usuario vencer
    E o robo for executado
  	Então o sistema deverá alterar a situacao da retificacao para Suspensa