<h3>Using:</h3>
- [mySql 5.6](https://dev.mysql.com/doc/refman/5.6/en/dynindex-command.html) via terminal access. 
- [SQL Fiddle ](http://sqlfiddle.com) set to MySQL 5.6 can be useful also.

<h3>How?</h3>
<em> Importing and exporting of databases requires that the mysql database exists </br></em>
<p>Creating a dump of the database </br>
<code>$ mysqldump -uusername -ppassword database &gt filename </code> </br>
<b>example:</b> $ mysqldump -u root -p simpleUsers < simpleUsersDump.sql
</br>
Loading in the database from a dump file </br>
<code>$ mysql -uusername -ppassword database &lt filename </code> </br>
<b>example:</b> $ -u root -p simpleUsers &lt simpleUsersDump.sql 
</p>

<h3>More info</h3>
<b>see:</b> [terminal commands](http://dev.mysql.com/doc/refman/5.7/en/mysql-commands.html)[*](http://cse.unl.edu/~sscott/ShowFiles/SQL/CheatSheet/SQLCheatSheet.html)
