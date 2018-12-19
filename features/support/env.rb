require 'rspec'
require 'cucumber'
require 'selenium/webdriver'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'pry'
require 'pg'
require 'faker'

include Capybara::DSL

Capybara.register_driver :selenium do |globalweb|
	Capybara::Selenium::Driver.new(globalweb, :browser => :chrome)
end

Capybara.configure do |config|
    Capybara.current_driver = :selenium
    config.default_max_wait_time = 30
    Capybara.ignore_hidden_elements = false
    #Capybara.page.driver.browser.manage.window.maximize # - Local
    Capybara.page.driver.browser.manage.window.resize_to(1360,768) # - CodeShip
end