class AnaliseParecer
    def AnaliseParecer.IniciaAnalise
        first(:link, "Analisar").click
        first(:link, "Iniciar Análise").click
        first(:link, "Sim").click
    end

    def AnaliseParecer.LiberaAbas
        find("[title='Parecer']").click
        check("Propriedade")
        check("Mapa")
        check("Compromissos Anteriores")
        check("Reserva Legal")
        click_link("Alterar liberação de abas")
        find("[id*=cmdLiberacaoAbas]").click
    end

    def AnaliseParecer.RespInfoBasicas(naoAplica)

        infoBasicas1 = "Os proprietários e posseiros declarados parecem estar corretos e parecem ser os reais ocupantes do espaço?"
        infoBasicas2 = "O tipo de dominio foi corretamente declarado como propriedade e/ou posse?"
        infoBasicas3 = "A área declarada da propriedade na data de 22 de julho de 2008 parece estar corretamente informada, inexistindo evidências de desmembramento após 2008 que implique na mudança do enquadramento das obrigações do Programa de Regularização Ambiental para o imóvel em questão?"
        infoBasicas4 = "As declarações assinaladas, inclusive a referente à utilização principal da propriedade, parecem estar corretas e refletir as reais características do imóvel rural?"
        infoBasicas5 = "As informações relativas a espólio e/ou usufruto declarados parecem estar corretas?"
        infoBasicas6 = "O imóvel aparenta ter sido corretamente declarado como urbano ou rural?"
        infoBasicas7 = "Todos os campos obrigatórios foram preenchidos corretamente?"
        infoBasicas8 = "As informações e documentos apresentados no presente cadastro estão corretos, adequados e completos?"

        marcaNao = find(".ModuloItem", text: infoBasicas1).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: infoBasicas2).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: infoBasicas3).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: infoBasicas4).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: infoBasicas5).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: infoBasicas6).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: infoBasicas7).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: infoBasicas8).choose(naoAplica)
    end
    def AnaliseParecer.RespLimite(naoAplica)

        find(:link, "Limite da Propriedade e Servidão Administrativa").click

        limite1 = "O limite da propriedade parece refletir a realidade de acordo com a imagem e/ou com a área declarada, e/ou com documentação apresentada pelo proprietário e/ou produzida pela SMA?" 	
        limite2 = "Eventuais servidões administrativas parecem estar corretamente demarcadas?"	 	
        limite3 = "A área declarada e a área constante no mapa são suficientemente aproximadas?"

        marcaNao = find(".ModuloItem", text: limite1).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: limite2).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: limite3).choose(naoAplica)
    end

    def AnaliseParecer.App(naoAplica)

        app1 =  "Todos os corpos d'água parecem estar corretamente demarcados, de acordo com a imagem e com outras fontes de informação disponíveis?"
        app2 = 	"Todas as informações associadas aos corpos d'água declarados (largura de rios, tipo de corpo d'água) parecem estar adequadas em relação à imagem?"
        app3 = 	"As APPs de rios, córregos e nascentes foram geradas/demarcadas conforme determinado em legislação?"
        app4 = 	"Eventuais APPs de Outros Corpos d'Água, Declividade, Topo de Morro, Borda de Tabuleiro ou Chapada, Altitude, Manguezal, Restinga e outras parecem estar corretamente demarcadas?"
        app5 = 	"Os limites e usos das áreas de Uso Consolidado em APP declaradas parecem estar adequados em relação à imagem base de 2008 e outros materiais de referência disponíveis?"
        app6 = 	"Eventuais áreas de Declividade entre 25° e 45° parecem estar corretamente demarcadas?"
        app7 = 	"Os limites e o uso declarado das áreas de Uso Consolidado em Áreas de Declividade entre 25° e 45° parecem estar adequados em relação à imagem base de 2012?"
        app8 = 	"Os limites e uso das áreas de Uso Consolidado declaradas em RL parecem estar adequados em relação à imagem base de 2008?"

        find(:link, "APP e Uso Restrito").click

        marcaNao = find(".ModuloItem", text: app1).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: app2).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: app3).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: app4).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: app5).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: app6).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: app7).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: app8).choose(naoAplica)
    end
    def AnaliseParecer.VegetNativa(naoAplica)
        vegetNativa1 = "Todos os fragmentos de vegetação nativa parecem ter sido corretamente demarcados de acordo com as imagens disponíveis?"
        vegetNativa2 = "Durante a análise com os materiais disponíveis, a vegetação nativa existente em 2008 parece ter sido mantida, de acordo com a legislação pertinente?"

        find(:link, "Vegetação Nativa").click
        
        marcaNao = find(".ModuloItem", text: vegetNativa1).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: vegetNativa2).choose(naoAplica)
    end

    def AnaliseParecer.ReservaLegal(naoAplica)
        rlFinal = "A área total de RL instituída ou proposta sob todas as formas alcança os percentuais mínimos definidos na legislação para o imóvel em questão, e sua localização, forma de instituição e projetos de restauração ecológica foram aprovados?"

        find(:link, "RL").click
        find(:link, "RL Final").click
    
        marcaNao = find(".ModuloItem", text: rlFinal).choose(naoAplica)
    end

    def AnaliseParecer.AdeqFinal(naoAplica)

        adeqFinal1 = "O(a) responsável selecionou a opção ‘Adequação Conforme Lei 4771/65 na aba Passivos Ambientais?"
        adeqFinal2 = "O(a) responsável selecionou a opção de adesão ao PRA na aba Passivos Ambientais e o imóvel não possui áreas a recompor?"
        adeqFinal3 = "O(a) responsável selecionou optou por não aderir ao PRA e o imóvel não possui áreas a recompor?"

        find(:link, "Adequação Final").click

        marcaNao = find(".ModuloItem", text: adeqFinal1).choose(naoAplica)
        marcaNao = find(".ModuloAlternado", text: adeqFinal2).choose(naoAplica)
        marcaNao = find(".ModuloItem", text: adeqFinal3).choose(naoAplica)
    end

    def AnaliseParecer.Salva
        find(:link, "Salvar respostas do Parecer").click
    end

    def AnaliseParecer.ConcluiAnalise(numCar)
        find(:link, "Iniciar/Concluir Análise").click
        Navegador.verificaPopUp
        find(:link, "Verificar Problemas").click
        Navegador.verificaPopUp
        verificaProblema = find("#ctl00_conteudo_TabContainer1_TBIniciar_carAnalise_lblMensagem", visible:true).text
    
        if verificaProblema == "Análise verificado com sucesso! Nenhum problema Encontrado!"
            puts(verificaProblema)
            puts("CAR de número: " +  numCar + " disponível para análise")
        else
            puts("Algo deu errado!, acesse o CAR " + numCar + " para verificar")
        end
    end
end