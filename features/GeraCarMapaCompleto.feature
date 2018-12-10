#language: pt
#utf-8

@GeraCarMapaCompleto

Funcionalidade: Gerar CAR com Mapa Completo
  Eu como usuario do CAR
  Quero executar um script
  Para criar que contenha todos os Desenhos

  @tira_print

  Cenario: Gerar Car com todos os polígonos
  	Dado que esteja cadastrando o CAR
  	Quando preencher todos os campos
    E realizar todos os desenhos
  	Então o sistema criará o CAR completo