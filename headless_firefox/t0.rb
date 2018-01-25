
require 'selenium-webdriver'


headless = ENV['HEADLESS'] != 'false'


# brew install geckodriver

options = headless ? [ '-headless' ] : []
options = Selenium::WebDriver::Firefox::Options.new(args: options)

driver = Selenium::WebDriver.for(:firefox, options: options)

driver.get('https://google.com')

input = driver.find_element(:css, '#lst-ib')
sleep 1
input.send_keys('hiroshima.rb')
sleep 1
input.send_keys("\n")

driver
  .find_elements(:css, 'div.g h3 a')
  .each { |a| puts a.attribute('href') }

sleep 7 unless headless

