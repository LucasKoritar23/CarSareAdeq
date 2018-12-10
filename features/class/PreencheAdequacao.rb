class PreencheAdequacao
    def PreencheAdequacao.CompromissosAnteriores
        first("[id*='AdequacaoAmbiental']", visible: true).click
        Navegador.verificaPopUp
        #Auto de Infração
        opcaoAIA = find("[id*='trPossuiAIA']").text
        choose("Não", visible: true)
        Navegador.verificaPopUp

        #Órgão Ambiental
        find("[title='Órgão Ambiental']").click
        Navegador.verificaPopUp
        opcaoOrgaoAmbiental = find("[id*='CARCompromissoOrgaoAmbiental_trPossuiCompromisso']", visible: true).text
        choose("Não", visible: true)

        #Órgão Externo
        find("[title='Órgão Externo']").click
        Navegador.verificaPopUp
        opcaoOrgaoExterno = find("[id*='CARCompromissoOrgaoExterno_trPossuiCompromisso']").text
        choose("Não", visible: true)

        #Decisão Judicial
        find("[title='Decisão Judicial']").click
        Navegador.verificaPopUp
        opcaoDecisaoJudicial = find("[id*='CARDecisaoJudicial_trPossuiDecisaoJudicial']").text
        choose("Não", visible: true)
    end

    def PreencheAdequacao.PassivosAmbientais(criaProjeto)
        find("[title='Passivos Ambientais']").click
        Navegador.verificaPopUp
            if (criaProjeto == "PRADA")
                choose("Sim", visible: true)
            end
            if(criaProjeto == "")
                choose("Não", visible: true)
            end
            if(criaProjeto == "4771")
                choose("Não, pois meu imóvel já está adequado de acordo com a Lei Federal 4771/1965", visible: true)
            end
        desenhaProp2008 = find(".ModuloAlternado", text: "Propriedade em 2008")
        desenhaProp2008.find(:css, "a[href]").click
        page.driver.browser.switch_to.frame(1)
        check("ucCARAreaMapaAdequacao$chkCopiaPropiedade")
        Navegador.verificaPopUp
        sleep(5)
        find(:link, "Sair do Mapa").click
        find(:link, "Calcular os passivos").click
        Navegador.verificaPopUp
        Navegador.verificaPopUp
        Navegador.verificaPopUp
        PreencheAdequacao.ObtemAreasRecompor
    end

    def PreencheAdequacao.ObtemAreasRecompor
        areasRecompor = find("#ctl00_conteudo_TabContainer1_TabAdequacaoAmbiental_TBAdequacaoCadastro_TBAdequacaoMapa_carAreaAdequacao_gvConsulta > tbody > tr:nth-child(13) > td:nth-child(3)").text
        puts("O car possui " + areasRecompor + " para recompor")
    end

    def PreencheAdequacao.ObtemDeficit
		first("[id*='AdequacaoAmbiental']", visible: true).click
		sleep(2)
		find(:link, "Reserva Legal").click
		sleep(2)
        @areaRestante = find("[id*='totalDeficit']").text
        PreencheCar.RecebeDeficit(areaRestante = @areaRestante)
	end

    def PreencheAdequacao.Finalizar(tipoFinalizacao)
        Navegador.verificaPopUp
        find("[id*='FinalizarAdequacao']").click
            if(tipoFinalizacao == "4771")
                find("[id*='chkCompromissoPRA']").click
                find("[id*='chkDeclarePRA']").click
            end
        find("[id*='CARAdequacaoFinaliza_cmdFinaliza']").click
        Navegador.verificaPopUp
        Navegador.verificaPopUp
        Navegador.verificaPopUp
    end
end