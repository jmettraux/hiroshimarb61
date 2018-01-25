
require 'selenium-webdriver'


headless = ENV['HEADLESS'] != 'false'

options = Selenium::WebDriver::Chrome::Options.new
if headless
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('window-size=1280x800')
end
options.add_argument('disable-infobars')

driver = Selenium::WebDriver.for(:chrome, options: options)

driver.navigate.to('https://google.com')

input = driver.find_element(:css, '#lst-ib')
sleep 1
input.send_keys('hiroshima.rb')
sleep 1
input.send_keys("\n")

driver
  .find_elements(:css, 'div.g h3 a')
  .each { |a| puts a.attribute('href') }

sleep 7 unless headless

