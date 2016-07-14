SELECT state, stateName FROM State ORDER BY state ASC;
/*50 states*/
SELECT state, stateName FROM State WHERE state!='GU' AND state!='VI' AND state != 'PR' ORDER BY state ASC;
/*US territories*/
SELECT state, stateName FROM State WHERE state='GU' OR state='VI' OR state = 'PR' ORDER BY state ASC;
/*Users from a select state*/
SELECT firstName from User WHERE id IN (Select id from Address WHERE state = 'CA');


