#language: pt
#utf-8

@AlterarAreasMapa

Funcionalidade: Alterar Áreas no Mapa
  Eu como usuario do CAR
  Quero executar um script
  Para Alterar Áreas no Mapa do CAR

  @tira_print

  Esquema do Cenário: Alterar áreas no Mapa e importar novas áreas para o SARE
  	Dado que o '<numcar>' esteja como Inscrito e adequacao como Prada
  	Quando solicitar alteração no CAR
    E alterar areas no Mapa
    E Finalizar o CAR
    E Finalizar a adequacao
  	Então irá alterar as áreas do Sare

    
    Exemplos:
    |     numcar   |
    |35332540355215|