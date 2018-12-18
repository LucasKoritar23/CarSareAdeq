#language: pt
#utf-8

@DeferirArtigo68

Funcionalidade: Deferir Artigo 68
  Eu como usuario SAA do CAR
  Quero executar um script
  Para Deferir a solicitação do Artigo 68

  @tira_print

  Cenario: Deferir 68
  	Dado o car tenha solicitado ao 68
    Quando o usuario SAA deferir o 68
    Então a situação da AA irá para Imovel ambientalmente adequado