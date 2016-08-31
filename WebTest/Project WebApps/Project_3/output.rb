#!/usr/bin/ruby
=begin
  Author: Jincheng Liu, Brandon Stone
  Provided an array containing job information generates an html
  file to display job information.
=end
class HTML_Generator
  def initialize
    @output = File.open("JobSearch.html", "w")
    @output.puts "<!DOCTYPE html>"
    @output.puts "<html>"
    @output.puts "<head>"
    @output.puts "<meta charset='utf-8'>"
    @output.puts "<title>Osu Jobs Crawler</title>"
    @output.puts "<style>"
    @output.puts "table {"
    @output.puts "font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;"
    @output.puts "width: 100%;"
    @output.puts "border-collapse: collapse;}"

    @output.puts "td, th {"
    @output.puts "font-size: 1em;"
    @output.puts "border: 1px solid #98bf21;"
    @output.puts "padding: 3px 7px 2px 7px;"
    @output.puts "th{"
    @output.puts "font-size: 1.1em;"
    @output.puts "text-align: left;"
    @output.puts "padding-top: 5px;"
    @output.puts "padding-bottom: 4px;"
    @output.puts "background-color: green;"
    @output.puts "color: white;"
    @output.puts "}"
    @output.puts "</style>"
    @output.puts "</head>"

#body part
    @output.puts "<body >"
    @output.puts "<table>"
    @output.puts "<caption style=\"font-size: 2em;\">Jobs Search Result</caption>"
    @output.puts "<tr>"
    @output.puts "    <th>University Title</th>"
    @output.puts "    <th>Working Title</th>"
    @output.puts "    <th>Department</th>"
    @output.puts "	 <th>Application Deadline</th>"
    @output.puts "	 <th>Target Salary</th>"
    @output.puts "	 <th>Full/Part time</th>"
    @output.puts "	 <th>Dept Contact Phone</th>"
    @output.puts "   <th>Job Opening Number</th>"
    @output.puts "  </tr>"
  end
=begin
  Assumes: array has 8 elements following the order provided by the
  table details above.

=end
  def add_job(array)
    @output.puts "<tr>"
    @output.puts "    <td>#{array[0]}</td>"
    @output.puts "    <td>#{array[1]}</td>"
    @output.puts "    <td>#{array[2]}</td>"
    @output.puts "    <td>#{array[3]}</td>"
    @output.puts "    <td>#{array[4]}</td>"
    @output.puts "    <td>#{array[5]}</td>"
    @output.puts "    <td>#{array[6]}</td>"
    @output.puts "    <td>#{array[7]}</td>"
    @output.puts"  </tr>"
  end
=begin
  Requires: no calls to the add jobs function
  to be called after calling this method.
  Provide: closing html to the document.
=end
  def no_more_jobs
    @output.puts"</table>"
    @output.puts"</body>"
    @output.puts"</html>"
    @output.close
  end

end