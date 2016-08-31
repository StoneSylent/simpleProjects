#!/usr/bin/ruby -w
require "mechanize"

=begin
Testing the Mechanize gem.
@Author: Brandon Stone
=end
  system "clear" #talks to the terminal.


  links = Array.new
  agent = Mechanize.new

  page = agent.get "http://google.com"
  page.links.each do |link|
    links << link.text
  end
puts "Links are: #{links}"
puts ""
puts "\#\{page\}: #{page}"
page.save 'mech_test_pp.html'

=begin
google_form = page.form('f') #targets the form
google_form.q = 'ruby mechanize' #fills the form
page = agent.submit(google_form) #submits the form
pp page
=end
puts "-------------------------------------------------"
puts "-------------------------------------------------"
