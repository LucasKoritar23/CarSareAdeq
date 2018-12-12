class ConectaBanco
    require 'tiny_tds'
        def ConectaBanco.acesso
            @client = TinyTds::Client.new username: 'usrSigam', password: '@@S.m.a.1',
            host: 'sigampredb01', port: 1433
            # = Host Ambiente de Teste / Homologação host: 'db-dev01', port: 1433
            puts 'Connecting to SQL Server'
            if(@client)
                puts("conexão OK")
            else
                puts("conexão NOK")
            end
        end
    
        def ConectaBanco.alteraPrazoAssinatura(idProjeto)
            #results = @client.execute("UPDATE [SMA-EST-CAR_test].dbo.[SARETERMO] set DatData = dateadd (dd, -2, DatData), datAssinatura = dateadd (dd, -3, datAssinatura) where idProjeto = '#{idProjeto}'")
            results = @client.execute("UPDATE [Sigam_20181122].dbo.[SARETERMO] set DatData = dateadd (dd, -2, DatData), datAssinatura = dateadd (dd, -3, datAssinatura) where idProjeto = '#{idProjeto}'")
            results.each do |linha|
            end
        end
    
        def ConectaBanco.alteraPrazoAssinaturaRetif(numRetificacaoBD)
            #results = @client.execute("UPDATE [SMA-EST-CAR_test].dbo.[SARE_TERMORETIFICACAO] set dataGeracao = dateadd (dd, -2, dataGeracao), datAssinatura = dateadd (dd, -3, datAssinatura) where numRetificacao = '#{numRetificacaoBD}'")
            results = @client.execute("UPDATE [Sigam_20181122].dbo.[SARE_TERMORETIFICACAO] set dataGeracao = dateadd (dd, -2, dataGeracao), datAssinatura = dateadd (dd, -3, datAssinatura) where numRetificacao = '#{numRetificacaoBD}'")
            results.each do |linha|
            end
        end
    end