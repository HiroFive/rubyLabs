require 'mechanize'

browser = Mechanize.new

browser.log = Logger.new("mechanize.log")
browser.log.level = Logger::INFO

browser.get("https://myanimelist.net/login.php?from=%2F")

browser.page.forms.first do |form|
  form.field_with(name: 'email').value = Parser_program::Uzer.email
  form.field_with(name: 'password').value = Parser_program::Uzer.password
end

browser.page.forms.first.submit