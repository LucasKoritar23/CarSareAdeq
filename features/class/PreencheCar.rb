class PreencheCar
    def PreencheCar.AcessaCar
        first(".Atendimento", text: "SiCAR/SP", visible: true).click
        if (assert_text("Cadastrar Nova Propriedade"))
			find(:link, "Cadastrar Nova Propriedade").click
			puts("Já existe car para este usuário")
		else
			puts("Não existe CAR para este usuário, criando seu primeiro CAR")
		end
	end
	
	def PreencheCar.AcessaCarConsultaGerencial
		first(".Atendimento", text: "SiCAR/SP", visible: true).click
    	find(:link, "Consulta Gerencial").click
	end

    def PreencheCar.AbaProriedade(nomeCAR,muni)
        choose("Rural")
        check("Propriedade")
        choose("Proprietário")
        find("input[name*='nomPropriedade']").set(nomeCAR)
        find("input[name*='desEndereco']").set("Av Professor Frederico Hermann JR")
        find("input[name*='nomBairro']").set("Alto de Pinheiros")
        find("input[name*='numCEP']").set("07193280")
        find("[name*='ddlMunicipio']").find(:option, muni).select_option
        find("input[name*='numArea']").set("2702")
        find("input[name*='area2008']").set("2702")
        choose("Criação Animal")
        find("[id*='carCadastro_cmdAtualiza']").click
        numProtocolo = find(:id, "ctl00_conteudo_lblID").text
        puts("Car sendo gerado... Número do Protocolo: " + numProtocolo)
    end

    def PreencheCar.PessoasAbaDominio
        PreencheCar.AbaDominio(cpfPessoa = "88258394800", permissao = "Tecnico") # cpf da maracs
	    PreencheCar.AbaDominio(cpfPessoa = "32660716897", permissao = "Representante") #cpf da leila
    end

    def PreencheCar.AbaDominio(cpfPessoa,permissao)
        find(:link, "Domínio").click
			if permissao == "Tecnico"
				find(:link, "Técnicos").click
                find(".BotaoCmd", text: "Adicionar", visible: true).click
				find("input[name*='CPFCNPJ']").set(cpfPessoa)
                find(:link, "Confirmar").click
                find("[name*='ddlInstituicao']").find(:option, "SMA").select_option
            end

			if permissao == "Representante"
				find(:link, "Representantes").click
				find(".BotaoCmd", text: "Adicionar", visible: true).click
				find("input[name*='CPFCNPJ']").set(cpfPessoa)
				find(:link, "Confirmar").click
				sleep(2)
				first("input[id*=chkPodeAlterar]").click
			end
		sleep(5)
		find(:link, "Salvar", visible: true).click
    end

    def PreencheCar.AbaDominio_InsereMatricula
        find(:link, "Domínio").click
        find(:link, "Matrículas").click
		sleep(2)
		first("[id*='carMatricula_cmdInclui']").click
		find("[name*='ddlComarca']").find(:option, "Guarulhos").select_option
		find("input[name*='nomCartorio']").set("1234")
		find("input[name*='numMatricula']").set("12345")
		find("input[name*='livro']").set("123456")
        first("[id*='carMatricula_cmdAtualiza']").click
        sleep(3)
    end

    def PreencheCar.AbaDeclaracoes
        first("[id*='TabNavegacao_TBDeclaracao']", visible: true).click
        find("[id*='ctl07_chkDeclara']").click
    end

    def PreencheCar.AbaAnexos
        find("[title='Arqivos Anexos ao CAR']").click
		find(".BotaoCmd", text: "Adicionar", visible: true).click
		find("[name*='ddlTipoAnexo']").find(:option, "Procuração do Proprietário").select_option
		find("[id*='carAnexo_desConteudo']").set("Criado pelo teste automatizado")
		attach_file('ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBAnexo$carAnexo$fileUpload$ctl02', File.absolute_path('anexos/Procuracao.pdf'))
        sleep(3)
		find(".BotaoCmd", text: "Salvar", visible: true).click
		sleep(3)
    end

    def PreencheCar.MarcaNaoExiste(artigo)
		textoServidaoAdm = "Servidão Administrativa"
		textoRiosMais = "Rios com mais de 3 metros de largura média"
		textoRiosMedia = "Rios com até 3 metros de largura média"
		textoNascente = "Nascentes e Veredas"
		textoOutrosCorpos = "Outros corpos d'água"
		textoOutrasApps = "Outras APPs"
		textoVegetacao = "Vegetação Nativa"
		textoReservaLegal = "Reserva Legal"
		textoDeclividade = "Declividade entre 25° e 45°"
		textoUsoConsolidado = "Uso consolidado"
		textoRLCompensacao = "Reserva Legal de Compensação"
		textoServidaoAmb = "Servidão Ambiental"
		textoLagoLagoa = "Lago e Lagoa Natural"

		link = (current_url)
		if (link == "http://pre.sigam.ambiente.sp.gov.br/Sigam/CAR/CARAdm.aspx?idPagina=13076" || link == "http://exec-dev01.sma.local/sigam-pre-prod/CAR/CARAdm.aspx?idPagina=13076")
				textoRLCompensacao = "Reserva legal de compensação"
		end
        
		flegaArea = find('.ModuloAlternado', text: textoServidaoAdm)
		flegaArea.find('input[type=checkbox]').click

		flegaArea = find('.ModuloAlternado', text: textoRiosMais)
		flegaArea.find('input[type=checkbox]').click

		flegaArea = find('.ModuloItem', text: textoRiosMedia)
		flegaArea.find('input[type=checkbox]').click

		flegaArea = find('.ModuloAlternado', text: textoNascente)
		flegaArea.find('input[type=checkbox]').click

		flegaArea = find('.ModuloItem', text: textoLagoLagoa)
		flegaArea.find('input[type=checkbox]').click

		flegaArea = find('.ModuloAlternado', text: textoOutrosCorpos)
        flegaArea.find('input[type=checkbox]').click
        
			if artigo == "4771"
				puts("Não Marca " + textoOutrasApps)
			else
				flegaArea = find('.ModuloItem', text: textoOutrasApps)
				flegaArea.find('input[type=checkbox]').click
			end

			if artigo == "4771"
				puts("Não Marca " + textoVegetacao)
			else
				flegaArea = find('.ModuloItem', text: textoVegetacao)
				flegaArea.find('input[type=checkbox]').click
			end

			if artigo == "4771" || artigo == "Def_RL" || artigo == "Exc_RL" || artigo == "PRADA"
				puts("Não Marca " + textoReservaLegal)
			else
				flegaArea = find('.ModuloAlternado', text: textoReservaLegal)
				flegaArea.find('input[type=checkbox]').click
            end
    
		flegaArea = find('.ModuloItem', text: textoDeclividade)
		flegaArea.find('input[type=checkbox]').click

		flegaArea = find('.ModuloAlternado', text: textoUsoConsolidado)
		flegaArea.find('input[type=checkbox]').click

		if(artigo == "Exc_RL")
			puts("Não Marca " + textoRLCompensacao)
		else		
			flegaArea = find('.ModuloItem', text: textoRLCompensacao)
			flegaArea.find('input[type=checkbox]').click
		end

		if(artigo == "Exc_RL")
			puts("Não Marca " + textoServidaoAmb)
		else
			flegaArea = find('.ModuloAlternado', text: textoServidaoAmb)
			flegaArea.find('input[type=checkbox]').click
		end
	end

		def PreencheCar.AlteraProcessoAptidao(usuario,numCar)
			textoAreaEmUC = "Área Inserida em UC"
			first(".Atendimento", text: "SiCAR/SP", visible: true).click
			find(:link, "Consulta Gerencial").click
			RealizaBusca.CAR(numCar)
			first(:link, "Analisar").click
			first("[id*='TBArea']", text: "Mapa").click
			flegaArea = first('.ModuloItem', text: textoAreaEmUC)
			flegaArea.first(:css, 'a[href]').click
			page.driver.browser.switch_to.frame("ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_ifrmMapa")
			sleep(2)
			find("[title*='sobre o elemento selecionado']", visible: true, match: :first).click
			map = find(:id, "ucCARAreaMapa_ucCARGMapSketch1_CarGMap").native
			page.driver.browser.action.move_to(map,664, 236).click.perform
			sleep(2)
			page.driver.browser.switch_to.frame(0)
				if (usuario == "marianab")
					processo = "1919601" #idProcesso
					find("option[value='HABILITADA']").click
					sleep(5)
					fill_in("ctl01$txtIdentificadorDoProcesso", :with => processo)
					sleep(5)
					find(:id, "ctl01_txtProcessoAno").click
				end
				sleep(3)
				find(:link, "Salvar Atributos").click
				sleep(5)
				#Fim da interação com o iframe de atributos
				#retorna para o iframe do desenho
				page.driver.browser.switch_to.frame(1)
				find(:link, "Sair do Mapa").click
				sleep(5)
		end

	def PreencheCar.SolicitaAlteracao(alteracao)
		find("[title=Alterar]", match: :first).click
		find("[id*=cmdAltera]", match: :first).click
		Navegador.verificaPopUp
		Navegador.verificaPopUp
		Navegador.verificaPopUp
			if (alteracao == "UC")
				first("option[value='617']", visible: true).click
			else
				select("Acrescentar Anexos", :from => "ctl00$conteudo$TabContainer1$TabPanel1$TabNavegacao$TBFinaliza$carFinaliza$ddlMotivo")
			end
		find("textarea[id*='desMotivo']").set("Teste Automatiazado")
		find("a[id*='cmdSolicita']").click
		Navegador.verificaPopUp
		Navegador.verificaPopUp
		Navegador.verificaPopUp
		sleep(3)
		Navegador.verificaPopUp
		if (alteracao == "UC")
			textoAreaEmUC = "Área Inserida em UC"
			find(:link, "Mapa").click
			flegaArea = find('.ModuloItem', text: textoAreaEmUC)
			flegaArea.first(:css, 'a[href]').click
		end
	end

	def PreencheCar.RecebeDeficit(areaRestante)
		puts("Área a ser vinculada: " + areaRestante)
		@areaDeficitario = areaRestante
	end

	def PreencheCar.VinculaUC(numCarDef)
		sleep(3) 
		page.driver.browser.switch_to.frame("ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_ifrmMapa")
		sleep(2)
		find("[title*='sobre o elemento selecionado']", visible: true, match: :first).click
        map = find(:id, "ucCARAreaMapa_ucCARGMapSketch1_CarGMap").native
		page.driver.browser.action.move_to(map,664, 236).click.perform
		sleep(3)
		page.driver.browser.switch_to.frame(0)
		sleep(2)
        areaUC = find("[id*='lblAreaTotal']").text
        find(:link, "Vincular CAR").click
        find("[name*='txtnumCARVinculado']").set(numCarDef)
        find("[id*='txtArea']").click
        find("[id*='txtArea']").set(areaUC)
        find(:link, "Vincular").click
        sleep(3)
        find(:link, "Salvar Atributos").click
        sleep(3)
        page.driver.browser.switch_to.frame(1)
		find(:link, "Sair do Mapa").click
        sleep(5)
	end

	def PreencheCar.VinculaCAR(numCarDeficitario)

		textoReservaLegal = "Reserva Legal"
		textoRLCompensacao = "Reserva Legal de Compensação"
		textoServidaoAmb = "Servidão Ambiental"

		link = (current_url)
		if (link == "http://pre.sigam.ambiente.sp.gov.br/Sigam/CAR/CARAdm.aspx?idPagina=13076" || link == "http://exec-dev01.sma.local/sigam-pre-prod/CAR/CARAdm.aspx?idPagina=13076")
				textoRLCompensacao = "Reserva legal de compensação"
		end

		find(:link, "Cadastro Ambiental Rural", visible: true).click
		find(:link, "Mapa", visible: true).click
		flegaArea = find('.ModuloItem', text: textoRLCompensacao)
		flegaArea.first(:css, 'a[href]').click
		page.driver.browser.switch_to.frame("ctl00_conteudo_TabContainer1_TabPanel1_TabNavegacao_TBArea_carArea_ifrmMapa")
		sleep(2)
		find("[title*='sobre o elemento selecionado']", visible: true, match: :first).click
		map = find(:id, "ucCARAreaMapa_ucCARGMapSketch1_CarGMap").native
		page.driver.browser.action.move_to(map,600,368).click.perform
		sleep(5)
		page.driver.browser.switch_to.frame(0)
		sleep(3)
		find("[id*='cmdVincularNovo']").click
		find("[id*='txtnumCARVinculado']").set(numCarDeficitario)
		find("[id*='txtArea']").click
		sleep(2)
		find("[id*='txtArea']").set(@areaDeficitario)
		find("[id*='bdatDataInicial']").click
		find("[id*='cetDataInicial_prevArrow']").click
		inseredia = 20
		find(".ajax__calendar_day", text: inseredia).click
		find("[id*='bdatDataFinal']").click
		find("[id*='cetDataFinal_today']").click
		find("[id*='cmdAtualizaCarVnculado']").click
		find(:link, "Salvar Atributos").click
		sleep(5)
		Navegador.verificaPopUp
		page.driver.browser.switch_to.frame(1)
		sleep(5)
		find(:link, "Sair do Mapa").click
		sleep(5)
		find(:link, "Finalizar", visible: true).click
		find("[id*='carFinaliza_cmdFinaliza']").click
		Navegador.verificaPopUp
		sleep(3)
		Navegador.verificaPopUp
	end

    def PreencheCar.AbaFinalizar(possuiAreas)
        first("[id*='spanFinalizar']").click
		#aba Finaliza
		find("[id*='flaInformacao']").click
		find("[id*='flaCiencia']").click
			if possuiAreas == "RL"
				find("[id*='flaServidaoTemp']").click
			end
		find("[id*='flaNotificaEmail']").click
		first("[id*='cmdFinaliza']").click
		sleep(2)
		Navegador.verificaPopUp
		Navegador.verificaPopUp
		sleep(2)
		end
end