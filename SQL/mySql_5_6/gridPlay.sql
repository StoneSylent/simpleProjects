CREATE TABLE IF NOT EXISTS currentGrid
( `xValue` int UNSIGNED NOT NULL, `yValue` int UNSIGNED NOT NULL, `color` varchar(6) NOT NULL );

CREATE TABLE changesQueue
(LIKE currentGrid);

CREATE TABLE pastGrid ( `id` int UNSIGNED AUTO_INCREMENT, PRIMARY KEY (id), `startTime` datetime , `completeTime` timestamp DEFAULT CURRENT_TIMESTAMP, `steps` int UNSIGNED, `grid` text);

INSERT INTO changesQueue
(`xValue`, `yValue`, `color`)
VALUES
	(0, 0, '0131e2'),
	(2, 4, 'e25dfe'),
	(5, 7, 'e2ab89'),
	(4, 3, 'af159c'),
	(3, 8, 'c37c07'),
	(8, 4, '2965e1')
;

ALTER TABLE changesQueue
ADD (`id` int UNSIGNED AUTO_INCREMENT, PRIMARY KEY (id));


