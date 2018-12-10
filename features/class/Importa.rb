class Importa
    def Importa.Poligono(tipoImportacao)

        textoReservaLegal = "Reserva Legal"
        textoRLCompensacao = "Reserva Legal de Compensação"
        textoServidaoAmb = "Servidão Ambiental"
        textoVegetacao = "Vegetação Nativa"
        textoOutrasApps = "Outras APPs"

        link = (current_url)

        if (link == "http://pre.sigam.ambiente.sp.gov.br/Sigam/CAR/CARAdm.aspx?idPagina=13076")
            textoRLCompensacao = "Reserva legal de compensação"
        end

        find(:link, "Mapa").click

        if tipoImportacao == "Propriedade"
            find(:link, "Desenhar").click
            page.driver.browser.switch_to.frame("ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_ifrmMapa")
            find("[title='Aumentar o zoom']").click
            find("[title='Aumentar o zoom']").click
            find("[title='Aumentar o zoom']").click
            attach_file('ucCARAreaMapa_fuShape', File.absolute_path('anexos/Propriedade_GeraPrada.zip'))
            sleep(5)
            find("[value=Importar]").click
		    Navegador.verificaPopUp
            sleep(5)
            find(:link, "Sair do Mapa").click
		    Navegador.verificaPopUp
        end

        if tipoImportacao == "OutrasApps"
            flegaArea = find('.ModuloItem', text: textoOutrasApps)
            flegaArea.first(:css, 'a[href]').click
            page.driver.browser.switch_to.frame(1)
            attach_file('ucCARAreaMapa_fuShape', File.absolute_path('anexos/OutrasApps_416481.zip'))
            sleep(5)
            find("[value=Importar]").click
		    Navegador.verificaPopUp
            sleep(5)
            find(:link, "Sair do Mapa").click
		    Navegador.verificaPopUp
         end

         if (tipoImportacao == "RL_4771" || tipoImportacao == "VN_4771")
            if(tipoImportacao == "RL_4771")
                flegaArea = find('.ModuloAlternado', text: textoReservaLegal)
                flegaArea.first(:css, 'a[href]').click
            end
            if(tipoImportacao == "VN_4771")
                flegaArea = find('.ModuloItem', text: textoVegetacao)
                flegaArea.first(:css, 'a[href]').click
            end
            page.driver.browser.switch_to.frame(1)
            attach_file('ucCARAreaMapa_fuShape', File.absolute_path('anexos/OutrasApps_416481.zip'))
            sleep(5)
            find("[value=Importar]").click
            Navegador.verificaPopUp
            sleep(5)
            find(:link, "Sair do Mapa").click
            Navegador.verificaPopUp
        end

        if tipoImportacao == "ReservaLegal"
            flegaArea = find('.ModuloAlternado', text: textoReservaLegal)
            flegaArea.first(:css, 'a[href]').click
            page.driver.browser.switch_to.frame(1)
            attach_file('ucCARAreaMapa_fuShape', File.absolute_path('anexos/ReservaLegal_GeraPrada.zip'))
            sleep(5)
            find("[value=Importar]").click
		    Navegador.verificaPopUp
            sleep(5)
            find(:link, "Sair do Mapa").click
		    Navegador.verificaPopUp
         end

         if tipoImportacao == "RLCompensacao"
            flegaArea = find('.ModuloItem', text: textoRLCompensacao)
            flegaArea.first(:css, 'a[href]').click
            page.driver.browser.switch_to.frame(1)
            attach_file('ucCARAreaMapa_fuShape', File.absolute_path('anexos/ReservaLegalCompensacao_VincRL.zip'))
            sleep(5)
            find("[value=Importar]").click
		    Navegador.verificaPopUp
            sleep(5)
            find(:link, "Sair do Mapa").click
		    Navegador.verificaPopUp
         end

         
         if tipoImportacao == "ServidaoAmb"
            flegaArea = find('.ModuloAlternado', text: textoServidaoAmb)
            flegaArea.first(:css, 'a[href]').click
            page.driver.browser.switch_to.frame(1)
            attach_file('ucCARAreaMapa_fuShape', File.absolute_path('anexos/ServidaoAmbiental_VincRL.zip'))
            sleep(5)
            find("[value=Importar]").click
            sleep(5)
		    Navegador.verificaPopUp
            find(:link, "Sair do Mapa").click
		    Navegador.verificaPopUp
         end
    end
end