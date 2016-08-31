require "rubygems"
require "mechanize"
#require "pp"
#require "json"
require './output.rb'

=begin
	AUTHOR(S): Chaz Gordish, Tim, Brandon
	
	This ruby program will allow someone to search for a job listed on
	OSU's postings. The client will be able to search for a specific 
	keyword and/or location. The program will then create a text file
	which contains details for relevant job postings.
=end

def parse_data(page, index)
  page.parser.xpath("//div/table/tr[#{index}]/td").text
end

def fetch_data (page)

  universityTitle	  = parse_data(page, 4)
  workingTitle		  = parse_data(page, 5)
  department	      =	parse_data(page, 6)
  applicationDeadline = parse_data(page, 20)
  targetSalary	    = parse_data(page, 14)
  fullOrPartTime    =	parse_data(page, 17)
  deptContactPhone	= parse_data(page, 22)
  jobOpeningNumber  = parse_data(page, 8)

  a = [universityTitle, workingTitle, department, applicationDeadline,
       targetSalary, fullOrPartTime, deptContactPhone, jobOpeningNumber]
end

#Prompt the user to enter keyword for the job search
print "Please enter the keyword of the job you want to search(For instance \"computer\"): "
userinput=gets
userinput.chomp!
#Ask the user to wait 
puts "Please grab a beer and wait patiently while our program is fetching data for you :) "

agent = Mechanize.new
page = agent.get "https://www.jobsatosu.com/postings/search"


jobs_form = page.form
jobs_form.query = userinput
#jobs_form.field_with(:name=>'591').options[1].select
page = agent.submit(jobs_form)


reachedTarget,reachedEnd = false, false


pageLinks = Array.new
page.links.each do |l|

	#There will be no more listed jobs when you reach this point in the links
	reachedEnd = true if l.text == '2' && reachedTarget || l.text =='The Ohio State University, www.osu.edu'

	#These are the links we want to click on for the details of the job
	if reachedTarget && !reachedEnd && l.text != 'Bookmark' && l.text != 'View Details'
		pageLinks.push l.text
	end

	#The first job link is after the 'Targer Salary' link
	reachedTarget = true if l.text == 'Target Salary'
end

info_storage = Array.new
HTML_Gen = HTML_Generator.new

pageLinks.each do |link|
page2 = agent.page.link_with(:text => link).click
HTML_Gen.add_job(fetch_data(page2))

  #This has to be included or else there will be an error.
  page=agent.back
end

HTML_Gen.no_more_jobs


#If you want to understand the reasoning of how I put the links in the pageLinks array,
# run this piece of code below
#page.links.each {|link| puts link.text}
