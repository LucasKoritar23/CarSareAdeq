#language: pt
#utf-8

@GeraCarArt68

Funcionalidade: Gerar Car com Artigo 68
  Eu como usuario do CAR
  Quero executar um script
  Para criar um car com Artigo 68

  @tira_print

  Cenario: Criar CAR com Artigo 68
  	Dado que possua o CAR ser areas a recompor
  	Quando preencher os campos da adequação
    E solicitar a dipensa atraves do 68
    E finalizar a adequação
  	Então o car terá solicitado ao 68