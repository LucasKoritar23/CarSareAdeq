class ExecutaRobo
    def ExecutaRobo.SuspendeTermo
        linkRobo = "http://exec-dev01.sma.local/SMA-EST-CAR_test/WebServices/SareTermos.asmx"
        visit(linkRobo)
        find(:link, "Termo_Suspenso").click
        click_button("Invoke")
        sleep(5)
        VerificaAbas.fechaAbas
    end
    def ExecutaRobo.SuspendeRetificacao
        linkRobo = "http://exec-dev01.sma.local/SMA-EST-CAR_test/WebServices/SareTermos.asmx"
        visit(linkRobo)
        find(:link, "Retificacao_Suspensa").click
        click_button("Invoke")
        sleep(5)
        VerificaAbas.fechaAbas
    end
end