SELECT count(state), state FROM Address GROUP BY state;
SELECT count(state), state FROM Address GROUP BY state ORDER BY COUNT(state) ASC;
SELECT COUNT(state), state FROM Address GROUP BY state HAVING COUNT(state) > 1;
SELECT COUNT(state), state FROM Address GROUP BY state HAVING COUNT(state) > 1 ORDER BY COUNT(state) ASC;
