#language: pt
#utf-8

@AnaliseParecer

Funcionalidade: Analisar Parecer
  Eu como usuario do CAR
  Quero executar um script
  Para criar um CAR e analisar

  @tira_print

  Cenario: Analisar CAR via Parecer
  	Dado que o CAR esteja como Inscrito
  	Quando preencher todas as informações da aba Parecer
  	Então o CAR estará disponível para analisar