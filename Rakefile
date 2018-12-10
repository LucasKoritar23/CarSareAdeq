require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

#Cucumber::Rake::Task.new(:features) do |t|
 # t.profile = 'default'
#end

#task :default => :features

#COMANDO NO CMDER PARA GERAR A MASSA
#bundle exec rake build QUANT=3
vezes = ENV['QUANT'].to_i
vezes=1 if vezes.nil?

namespace :massa do
  desc 'Executar feature diversas vezes'
  task :GerarMassa do
    vezes.times do |x|
      p "VEZES: #{x}"
      sh 'cucumber --retry 50 -t @GeraCarExcedenteRL'
    end
  end
end
task build: %w[massa:GerarMassa]