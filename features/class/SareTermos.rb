class SareTermos
    def SareTermos.AbaArquivos(numTermoConvertido,tipoAnexo)
        find("[id*='TBTermo']", visible: true, :match => :first).click
        find("[id*='TabNavegacaoTermo_TBAnexo']", visible: true, :match => :first).click
        find("[id*='ucAnexo_cmdAdiciona']").click
        sleep(5)
        if(tipoAnexo == "TermoOrgaoEmissor")
            anexo = "Termo assinado somente pelo órgão emissor"
        end

        if(tipoAnexo == "DisponivelAssinatura")
            anexo = "Termo assinado"
        end

        if(tipoAnexo == "JustificativaTermo")
            Navegador.verificaPopUp
            sleep(3)
            anexo = "Justificativa do Termo – Prazo expirado"
        end

        find("[name*='ddlTipoAnexo']").find(:option, anexo).text
        find("[name*='ddlTipoAnexo']").find(:option, anexo).select_option
        select(numTermoConvertido, :from => "ctl00$conteudo$TabNavegacao$TBTermo$sareTermo$TabNavegacaoTermo$TBAnexo$ucAnexo$ddlNumeroDoc")
        find("[id*='desConteudo']").set("Inserindo anexo pelo teste automatizado...")
        attach_file('ctl00$conteudo$TabNavegacao$TBTermo$sareTermo$TabNavegacaoTermo$TBAnexo$ucAnexo$fileUpload$ctl02', File.absolute_path('anexos/Procuracao.pdf'))
        find("[id*='ucAnexo_cmdAtualiza']").click
        Navegador.verificaPopUp
        sleep(3)
    end

    def SareTermos.SituacaoTermo(sitAlterada)
        find(:link, "Termo", visible: true, :match => :first).click
        find("[id*='TBSubTermos']", visible: true, :match => :first).click
        if(sitAlterada == "DispAssinatura")
            situacaoTermo = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBSubTermos_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(12)").text
        end
        if(sitAlterada == "firmado" || sitAlterada == "suspenso")
            situacaoTermo = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBSubTermos_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(9)").text
        end  
        puts("Termo alterado para a situação: " + situacaoTermo)
    end
end