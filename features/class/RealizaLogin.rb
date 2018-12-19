class RealizaLogin
	def RealizaLogin.acesso(usuario)
		find('.Login').click
		fill_in('username', :with => usuario)
		fill_in('password', :with => "a")
		find(:id, "login").click
		sleep(3)
		find(:id, "ctl00_lnkLogo").click
	end
	def RealizaLogin.logoff
		sleep(3)
        find(:id, "ctl00_cmdLogin").click
        find(:link, "aqui").click
        sleep(2)
		puts("Deslogado com sucesso do ambiente!")
	end
end

#usuarios
		#Usuario Externo = 55613853720
		#usuario Externo = 03416907833
		#CAR Técnico = karinaac
		#SARE Técnica = renatam
		#SARE ADM = leilacm
		#Técnico SAA = 31245419870	- Amanda Hernandes Stefani
		#CAR Administador = 07902072818