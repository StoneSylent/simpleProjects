## Project 3: Web Scraping
<b>
Your group must meet and choose four project manager's for this assignment. All team members must participate in these choices. Choose four different team members to assign to each one of these roles. The project managers roles are:

* The overall project manager will coordinate and check quality for the entire project.
* The implementation project manager will coordinate and check quality for the coding tasks.
* The documentation project manager will coordinate and check quality for documenting code.
* The testing project manager will coordinate and check quality for testing code.
* The project managers should be chosen based on who already has the most experience related to topic areas involved in this assignment. Divide the assignment's work up equally amongst ALL group members. This includes project managers, who will also need to complete tasks towards a solution to the assignment. Remember everyone in the group will receive a single grade for group assignments.
</b>

## 1. Preliminaries
**Before** starting this project each team member must individually study the lecture material. For this assignment make sure you study the lecture notes on Git and Ruby. In addition, study material in the [Resources](http://web.cse.ohio-state.edu/~shareef/3901.sp15/resources/) section on the course website related to this project.

**A team member that is ill prepared before starting this project because s/he has not sufficiently studied the course material is not an excuse for that team member to contribute less work on the project. Those team members who know the least about the course material MUST put in more time to prepare in order to be able to contribute equally with all other team members. Those team members that are well prepared MUST work to help those that need help to come up to speed with the material. It is the responsibility of every team member to ensure that all team members contributed equally to the final solution submitted to the graders.**

You will be graded not only on your group's solution but also on how well your group worked together to arrive at your final solution. An imbalance of the work load will result in a lower grade regardless of the quality of the solution.

### Effective Team Work
Your team must have a face-to-face meeting each week with all team members present during the day and time you all agreed upon in your Project #1 submission. Though, I highly encourage your team to have additional face-to-face meetings. You should determine additional channels of communication with team members since you will need to integrate your work with others. Your team should plan and allocate time for integration well before the deadline. I suggest that the group work with the overall project manager to set team deadlines early so that all team members know the status of everyone's work. Create a schedule that all team members can agree to adhere to and work to achieve towards.

## 2. Web Scraping
Write a Ruby program to scrape and process some interesting data from a publicly accessible OSU site. Some possibilities are:

  * Careers at Ohio State (see "Search Jobs")
  * OSU News Room
  * Request a meeting with the university president
  * Courses as listed by the registrar

For example, your program might search the jobsatosu site for all job postings related to HTML or CSS. You could even use a cron job (see cron and crontab) to run the script, so that every morning your script querries for particular job postings, creates a digest, and sends you an email with the results.

As another example, you could automate the process of figuring out how many credits each course in a given list of courses is worth. For example, given a text file with the course numbers of all the GEC courses that count in the "Social Science" category, your tool would return the credit load of each individual course!

You can use whatever source for data you like, provided it is an OSU source and is publicly visible. If you are doing many successive querries, you must space them out in time (eg using sleep between successive GETs) so as to not overload the server. You can do whatever scraping and processing you like, provided the result is interesting and doesn't violate any department or university policies.

(A gem such as Mechanize can be very helpful for issuing HTTP requests, and a gem such as Nokogiri can help navigate the body of the response to find information of interest. Together, these two gems can greatly simplify your web scraping task. For instructions on how to make use of gems, see this [reference](http://web.cse.ohio-state.edu/~shareef/3901.sp15/labs/gems.html).)

<b>
This assignment will be graded using the following break down:

* 88% Implementation
* 5% Documentation
* 5% Testing
* 2% _README_ file (see below)

For documentation, clearly indicate the author(s) for portions of the code. For testing, you can submit code that you used to test your solution and/or provide a descriptive test plan that you used to test your solution. In other words, show the grader that your solution works.

Graders will retrieve your work (readme plus your solution) from your team's Github private repository provided for you under the course's organization cse3901-osu-2015sp. All team member's work must eventually be merged into a final committed version in Git. The readme contains the names of each project manager and states what each team member specifically contributed to the final submission. For the latter, only report on contributions that made it into to the final solution. Clearly indicate which team members performed testing and to which portions of the solutions. Also include any instructions to the grader as to how to execute the code.
</b>
