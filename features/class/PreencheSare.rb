require "rubyXL"
require "cpf_cnpj"
class PreencheSare

    def PreencheSare.AcessaSare
        find(:id,"ctl00_lnkLogo").click
        find("[src='imagens/logo/SARE.png']").click
        find(:id, "ctl00_conteudo_ctl00_rptrMenu_ctl00_imgLogo").click
    end

    def PreencheSare.AcessaMeusProjetos
        find(:id,"ctl00_lnkLogo").click
        find("[src='imagens/logo/SARE.png']").click
        find(:id, "ctl00_conteudo_ctl00_rptrMenu_ctl01_imgLogo").click
    end

    def PreencheSare.CadastroInicial(nomeSare)
        find(:link, "Cadastrar projetos com dispensa de CAR").click
        #aba Cadastro
        find("[name*='ddlMotivo']").find(:option, "Exigência da CETESB").select_option
        Navegador.verificaPopUp
        find("[name*='nomProjeto']").set(nomeSare)
        #Endereço
        find("[name*='txtEndereco']").set("Rua Automatizada")
        find("[name*='ddlMunicipio']").find(:option, "GUARULHOS").select_option
        find(:link, "Atualizar").click
        @numeroSare = find(:id, "ctl00_conteudo_lblNumeroSARE").text
        puts("Termo: " + @numeroSare + " sendo gerado...")
    end

    def PreencheSare.VinculaProcesso
        anoProcesso = "2017"
        find("[id*='cmdExibeGrid']").click
        #preenche o grid secundário
        find("[name*='txtFiltroAnoProcesso']", :with => anoProcesso)
        first(:link, "Pesquisar").click
        find(:id, "ctl00_conteudo_TabNavegacao_TBCadastro_ProjetoCadastroSemCar_PesqProcesso_gvConsulta_ctl02_rbRefDocumento").click
        numProcesso = find("#ctl00_conteudo_TabNavegacao_TBCadastro_ProjetoCadastroSemCar_PesqProcesso_txtNumProcesso").value
        puts("O processo vinculado é o : " + numProcesso)
    end

    def PreencheSare.Pessoa(nomPessoa,funcaoPessoa,tipoPessoa)
        cpfPessoa = CPF.generate
        cnpjPessoa = CNPJ.generate

        find(:link, "Pessoas").click
        find("[title='Adiciona uma Nova Pessoa']").click
            if tipoPessoa == "Física"
                find("[name*='CPFCNPJ']").set(cpfPessoa)
            else
                find("[name*='CPFCNPJ']").set(cnpjPessoa)
            end
        find(:link, "Confirmar").click
        find("[name*='nomPessoa']").set(nomPessoa)
        find("[name*='desEndereco']").set("Rua Testes QA")
        find("[name*='nomBairro']").set("Alto de Pinheiros")
        find("[name*='CEP']", visible: true).set("03259000")
        find("[name*='ddlMunicipio']", visible:true).find(:option , "Guarulhos").select_option
        find("[name*='ddlFuncao']", visible: true).find(:option, funcaoPessoa).select_option
        emailPessoa = "lucas.koritar@globalweb.com.br"
        find("[name*='Email']", visible:true, match: :first).set(emailPessoa)
        find(:link, "Cadastro Pessoas").click
        find("[name*='EmailConfirma']", visible:true).set(emailPessoa)

            if funcaoPessoa == "Representante legal"
                check("Responsável pela assinatura do Termo")
                find("[title='Grava os dados da Pessoa']").click
                Navegador.verificaPopUp
                find(:link, "Compromissário(s) Representado(s)").click
                find("[name*='chkCompromissario']", match: :first).click
                sleep(3)
                find("[title='Adicionar compromissários']").click
                sleep(3)
                attach_file('ctl00$conteudo$TabNavegacao$TBPessoa$ProjetoPessoa$TabNavegacao$TBRepresentanteLegal$responsavelTermo$fileUpload$ctl02',  File.absolute_path('anexos/Procuracao.pdf'))
                sleep(10)
                find(:link, "Adicionar Anexos").click
                sleep(3)
                find("[title='Grava as alterações']").click
                find("[id*='cmdFinaliza']", visible: true, match: :first).click
            end

            if funcaoPessoa == "Compromissário"
                find("[title='Grava os dados da Pessoa']").click
                validaMensagem = find("[id*='pesPessoa_lblMensagem']").text
                puts(validaMensagem)
                find("[title='Salva os dados e retorna para a Consulta']").click
            end
    end

    def PreencheSare.RetornaSare
        numeroSare = @numeroSare
        find("[src='imagens/logo/SARE.png']").click
        find(:link, "Análise Técnica (interno)").click
        RealizaBusca.Sare(numeroSare)
        find("[alt='Editar']").click
    end

    def PreencheSare.AlteraSituacao(usuario)
        puts("O projeto " + @numeroSare + " Está sendo alterado por " + usuario)
            if (usuario == "leilacm" || usuario == "karinaac" || usuario == "gtiadm" || usuario == "rosilened")
                find("[title='Analise']").click
                find("[title='Adiciona uma nova Análise']").click
                find("[id*='btnDataSituacao']").click
                find(".ajax__calendar_day", text: "20").click
                sleep(3)
                find("[name*='ddlSituacao']").find(:option, "Em análise").select_option
                sleep(3)
                find("[name*='desAnalise']").set("Teste Automatizado")
                find(".BotaoCmd", text: "Finalizar", match: :first, visible: true).click
                sleep(3)
                find(:link, "Termo").click
            end
    end

    def PreencheSare.GeraTermo(usuario,tipoTermo)
            if ((usuario == "leilacm" || usuario == "karinaac" || usuario == "rodrigolp" || usuario == "gtiadm") && tipoTermo == "TCRE")
                find("[name*='dplTermos']").find(:option, "TCRE – Termo de Compromisso de Restauração Ecológica").select_option
                find(:link, "Adicionar Termo").click
                find("[name*='txtDescVariavel']", match: :first).set("Unidade Automatizada")
                find("[name*='ckbUsaObrigacaoVariavel']", match: :first).click
                find("[name*='txtOrdemObrigacaoVariavel']", match: :first).set("1.15")
                find("[title='Grava as alterações']").click
                find(:link, "Gerar Termo").click
                Navegador.verificaPopUp
            end

            if ((usuario == "leilacm" || usuario == "karinaac" || usuario == "rodrigolp" || usuario == "gtiadm") && tipoTermo == "TCA")
                select("TCA – Termo de Compromisso da Adequação Ambiental", :from => "ctl00$conteudo$TabNavegacao$TBTermo$sareTermo$TabNavegacaoTermo$TBSubTermos$dplTermos")
                find(:link, "Adicionar Termo").click
                find("[title='Grava as alterações']").click
            end
    end

    def PreencheSare.DesenhaPropSare
        workbook = RubyXL::Parser.parse("anexos/Municipios.xlsx")
        numero = rand(1..688)
        nomMunicipio = workbook[0].sheet_data[numero][1].value
        find(:id, "__tab_ctl00_conteudo_TabNavegacao_TBArea").click
        find(:id, "ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_cmdInclui").click
        fill_in("ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$nomArea", :with => "Projeto SARE Automatizado")
        find("[value='ATLANTICA']").click
        sleep(5)
        select("Florestas Ombrófilas ou Estacionais", :from => "ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$ddlFitofisionomia")
        sleep(3)
        select("Unidade de Conservação Estadual", :from => "ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$ddlTipologia")
        sleep(3)
        unidade = "Área de Proteção Ambiental Cabreúva"
        fill_in("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBCadastroSemCar_areaCadastroSemCar_dpUC_txtText_Input", :with => unidade)
        sleep(10)        
        find(:id, "__tab_ctl00_conteudo_TabNavegacao_TBArea").click
        select(nomMunicipio, :from => "ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBCadastroSemCar$areaCadastroSemCar$ddlMunicipio")
        sleep(5)
        find(:id, "ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBCadastroSemCar_areaCadastroSemCar_cmdAtualiza").click
        find(:link, "Mapa").click
        find(:id, "ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl02_btnGeo").click
        page.driver.browser.switch_to.frame("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_ifrmMapa")
        find("[title='Aumentar o zoom']").click
        find("[title='Aumentar o zoom']").click
        find("[title='Desenhar forma']").click
        sleep(3)
        map = find(:id, "GMap").native
        page.driver.browser.action.move_to(map,565, 354).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,625, 343).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,623, 380).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,564, 359).click.perform
        sleep(10)
    end

    def PreencheSare.InsereCamposProp
        page.driver.browser.switch_to.frame(0)
        find('#txtNome').set('Propriedade Automatizada')
        find('#txtEndereco').set("Av Professor Hermann Jr")
        find("#txtComplemento").set("Sobrado - Teste Automatizado")
        find('#txtBairro').set("Alto de Pinheiros")
        find('#txtCep').set("03259000")
        find('#txtReferencia').set("Teste Automatizado do Koritar")
        find(:link,"Adicionar Dominialidade").click
        select("Amparo", :from => "ddlComarca")
        sleep(3)
        fill_in("txtCartorio", :with => "12345")
        sleep(2)
        fill_in("txtNumMatricula", :with => "1234")
        sleep(2)
        find("#rblPosse_0").click
        fill_in("txtPosse", :with => "12345")
        sleep(2)
        find(:link, "Adicionar").click
        find(:link, "Salvar Atributos").click
        sleep(3)
        page.driver.browser.switch_to.frame(1)
        find(:id, "bntFechar").click
        sleep(5)
    end

    def PreencheSare.NaoExiste
        check("ctl00$conteudo$TabNavegacao$TBArea$ProjetoAreaSemCar$TabNavegacao$TBMapa$MapaAreaSemCar$gvConsulta$ctl03$chkNaoExiste")
        check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl04_chkNaoExiste")
        check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl05_chkNaoExiste")
        check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl06_chkNaoExiste")
        check("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl07_chkNaoExiste")
    end

    def PreencheSare.DesenhaRestauracao
        find("#ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_gvConsulta_ctl08_btnGeo").click
        page.driver.browser.switch_to.frame("ctl00_conteudo_TabNavegacao_TBArea_ProjetoAreaSemCar_TabNavegacao_TBMapa_MapaAreaSemCar_ifrmMapa")
        find("[title='Desenhar forma']").click
        map = find(:id, "GMap").native
        page.driver.browser.action.move_to(map,664, 236).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,748, 229).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,753, 276).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,669, 283).click.perform
        sleep(3)
        page.driver.browser.action.move_to(map,666, 241).click.perform
        sleep(5)
        find("[title='Clique para salvar o estado do mapa']").click
        sleep(5)
        Navegador.verificaPopUp
        find(:link, "Fechar").click
        sleep(5)
    end
end