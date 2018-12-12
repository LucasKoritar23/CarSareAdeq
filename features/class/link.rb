class AcessaLink
    def AcessaLink.url
        #@link = "http://homologacao-sigam.eastus2.cloudapp.azure.com/sma-est-car_test/"
        #@link = "http://homologacao-sigam.eastus2.cloudapp.azure.com/sma-est-car"
        #@link = "http://exec-dev01.sma.local/SMA-EST-CAR_test/"
        @link = "http://pre.sigam.ambiente.sp.gov.br/sigam/"
        visit(@link)
    end
end