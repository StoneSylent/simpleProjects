SELECT * FROM changesQueue LIMIT 1;

/* pull the information */
SELECT * FROM changesQueue ORDER BY id ASC LIMIT 4;
/* remove the range of information */
DELETE FROM changesQueue WHERE `id` between 0 AND 200;
/* update current grid */
UPDATE changesQueue SET `color` = '2965e1' WHERE `id` = 1;

