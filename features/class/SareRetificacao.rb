class SareRetificacao
    def SareRetificacao.GeraRetificacao
        find("[id*='TBTermo']", visible: true, :match => :first).click
        find("[id*='TBRetificacao']", visible: true, :match => :first).click
        tipoRetificacao = "TCRE – Termo de Compromisso de Restauração Ecológica"
        find("[id*='ddlTermos']").find(:option, tipoRetificacao).text
        find("[id*='ddlTermos']").find(:option, tipoRetificacao).click
        find("[id*='lkbAdicionaRetificacao']").click
        sleep(2)

        find(".txtTextoRet1").set("Item Retificacao Manual")
        find(".txtTextoRet2").set("Item Retificacao Automatizada")
        find("[id*='SareTermoRetificacao_cmdAtualiza']").click
        retorno = find("[id*='lblRetorno']").text

        if(retorno == "Dados atualizados com sucesso")
            first("[id*='SareTermoRetificacao_cmdFinaliza']").click
            Navegador.verificaPopUp
            find("[id*='rblOpcoesImpressao_0']").click
            find("[id*='cmdFinalizaImpresao']").click
        else
            puts("Falha na geração da retificação...")
        end
    end

    def SareRetificacao.AbaArquivos(tipoAnexoRetif)
        find("[id*='TBTermo']", visible: true, :match => :first).click
        find("[id*='TBRetificacao']", visible: true, :match => :first).click
        retificacaoGrid = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBRetificacao_SareTermoRetificacao_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(6)").text
        @RetificacaoConvertida = retificacaoGrid.sub(/0/, '')
        find("[id*='TabNavegacaoTermo_TBAnexo']", visible: true, :match => :first).click
        find("[id*='ucAnexo_cmdAdiciona']").click

        if(tipoAnexoRetif == "RetifOrgaoEmissor")
            anexo = "Retificação assinada somente pelo órgão emissor"
        end

        find("[name*='ddlTipoAnexo']").find(:option, anexo).text
        find("[name*='ddlTipoAnexo']").find(:option, anexo).select_option
        find("[name*='ddlNumeroDoc']").find(:option, @RetificacaoConvertida).select_option
        find("[id*='desConteudo']").set("Inserindo anexo pelo teste automatizado...")
        attach_file('ctl00$conteudo$TabNavegacao$TBTermo$sareTermo$TabNavegacaoTermo$TBAnexo$ucAnexo$fileUpload$ctl02', File.absolute_path('anexos/Procuracao.pdf'))
        find("[id*='ucAnexo_cmdAtualiza']").click
        Navegador.verificaPopUp
        sleep(3)
    end

    def SareRetificacao.ObtemNumRetificacaoUpdateBD
        retificacaoGrid = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBRetificacao_SareTermoRetificacao_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(5)").text
        retificacaoConvertida = retificacaoGrid.sub(/0/, '')
        retificacaoConvertida = retificacaoGrid.sub(/2018/, '')
        numRetificacaoBD = retificacaoConvertida.to_i
        ConectaBanco.acesso
        ConectaBanco.alteraPrazoAssinaturaRetif(numRetificacaoBD)

    end

    def SareRetificacao.SituacaoRetificacao(sitAlterada)
        find(:link, "Termo", visible: true, :match => :first).click
        find("[id*='TBRetificacao']", visible: true, :match => :first).click
        if(sitAlterada == "RetificacaoOrgaoEmissor")
            #ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBRetificacao_SareTermoRetificacao_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(10)
            situacaoRetif = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBRetificacao_SareTermoRetificacao_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(11)").text
        end

        if (sitAlterada == "RetificacaoDisponivelAssinatura")
            situacaoRetif = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBRetificacao_SareTermoRetificacao_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(10)").text
        end

        if(sitAlterada == "RetificacaoSuspensa")
            situacaoRetif = find("#ctl00_conteudo_TabNavegacao_TBTermo_sareTermo_TabNavegacaoTermo_TBRetificacao_SareTermoRetificacao_gvPesquisa > tbody > tr.ModuloItem > td:nth-child(8)").text
        end
        puts("Retificacao alterado para a situação: " + situacaoRetif)
    end
end