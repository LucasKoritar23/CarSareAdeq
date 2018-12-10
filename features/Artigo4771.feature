#language: pt
#utf-8

@Artigo4771

Funcionalidade: Aderir ao Artigo 4771
  Eu como usuario do CAR
  Quero executar um script
  Para criar um car com Artigo 4771

  @tira_print

  Cenario: Car com artigo 4771
  	Dado que esteja criando o CAR
  	Quando Desenhar os polígonos para o artigo 
  	Então o CAR estará disponível com o artigo