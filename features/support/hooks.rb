Before do
  puts("Iniciando os testes pelo código automatizado")
end
  
After('@tira_print') do
  sleep(3)
  find(:id, "ctl00_cmdLogin").click
  find(:link, "aqui").click
  sleep(2)
  puts("Deslogado com sucesso do ambiente!")
end
  
  After do |scenario|
      nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/ , '')
      nome_cenario = nome_cenario.gsub(' ', ' ').downcase!
      print = "log/shots/#{nome_cenario}.png"
      page.save_screenshot(print)
      embed(print, 'image/png', 'Evidência da Execução')
  end