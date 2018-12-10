#language: pt
#utf-8

@FirmaTermo

Funcionalidade: Firmar Termo

Eu como usuario do Sare
Quero executar um script
Para criar projeto e firmar o termo

  @tira_print
	
  Cenario: Firmar Termo
  	Dado que possua projeto no Sare
  	Quando Gestor Gerar o Termo
    E anexar os documentos
  	Então o sistema irá firmar o Termo