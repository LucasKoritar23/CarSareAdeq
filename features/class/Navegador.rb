class Navegador
    def Navegador.verificaPopUp
            begin
                page.driver.browser.switch_to.alert
                true
                popUp = page.driver.browser.switch_to.alert.text
                puts(popUp)
                page.driver.browser.switch_to.alert.accept
            rescue Selenium::WebDriver::Error::NoAlertPresentError
                false
            end
    end
end