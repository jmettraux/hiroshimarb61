
require 'mechanize'


agent = Mechanize.new
page = agent.get('https://google.com/')

form = page.form('f')
form.q = 'hiroshima.rb'

page = agent.submit(form)

puts page.links.collect(&:text)

