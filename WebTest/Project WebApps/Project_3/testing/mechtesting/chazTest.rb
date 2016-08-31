require "rubygems"
require "mechanize"
require "pp"
require "json"

#agent = Mechanize.new
agent = Mechanize.new
page = agent.get "https://www.jobsatosu.com/postings/search"
#google = agent.get "http://www.google.com"
#google_form = page.form('f')
#google_form.q = 'Chaz Gordish'
#page = agent.submit(google_form)

#pp google

jobs_form = page.form
jobs_form.query = 'computer'
jobs_form.field_with(:name=>'591').options[1].select
page = agent.submit(jobs_form)

page.save 'jobs-lima.html'




