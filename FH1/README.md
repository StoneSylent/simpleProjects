<h3>What is this?</h3>
<p>In sort FH1 goes through a profile folder and renames everything found. </br>
Everything is divided into two groups, folders and files. Files are renamed </br> using the parent folders name followed by the number that are assigned based </br> on age of the file. Folders are named alphabetically based on age and depth.   
</p>
As an example when FH1 uses the 'test' profile:
<pre>
test:
B  B001  C

test/B:
A001  A002  A003

test/C:
A002  A003
</pre>
Renaming the 'test' profile contents to:
<pre>
test:
AA A0 AB

test/AA:
AA0 AA2 AA1
	
test/AB:
AB0 AB1
</pre>

<h3>Why?</h3>
<p>Over the years the family has acquired a large amount of family photographs. The naming convention FH1 uses follows the same naming convention that organizing the photos uses. Finding photo <b>AN45</b> after seeing it digitally should be easy.</p>

<h3>Running</h3>
<ul>
<li><b>requires:</b> Perl v5.18.2</li>
<li><b>setup:</b>  load into the profiles folder the contents you wish to rename.</li>
<li><b>execute:</b> <code>$ perl FH1profilerTest.pl &lt;profile&gt;</code>
</ul>

<h3> Where and when? </h3>
- [x] profiler.
- [x] create test profiles.
- [x] make class to get folder/files.
- [x] depth first search traversal of profile.
- [x] terminal output of mock-renames.
- [ ] clean-up output.
- [ ] move output to log file.
- [ ] transfer to move and rename.
- [ ] simulate crash and create fix point.

