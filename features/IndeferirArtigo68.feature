#language: pt
#utf-8

@IndeferirArtigo68

Funcionalidade: Indeferir Artigo 68
  Eu como usuario SAA do CAR
  Quero executar um script
  Para indeferir a solicitação do Artigo 68

  @tira_print

  Cenario: Indeferir 68
  	Dado o car tenha solicitado o artigo 68
    Quando o usuario SAA indeferir o 68
    Então a situação da AA irá para Aguarda Proposta de Reserva Legal