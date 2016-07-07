CREATE TABLE User
	(`id` int NOT NULL, PRIMARY KEY (`id`), `firstName` varchar(20), `lastName` varchar(20))
;
CREATE TABLE Address
	(`id` int NOT NULL, FOREIGN KEY(`id`) REFERENCES User(id), `state` varchar(2), `zipcode` varchar(10))
;
ALTER TABLE Address
	ADD COLUMN `city` varchar(20) AFTER `id`,
	ADD COLUMN `street` varchar(20) AFTER `id`,
	ADD COLUMN `number` int AFTER `id`
;
CREATE TABLE State
	(`state` varchar(2) NOT NULL, `stateName` varchar(20))
;

INSERT INTO User
	(`id`, `firstName`, `lastName`)
VALUES
	(1, 'Bob', 'Salmon'),
	(2, 'Joe', 'Fish'),
	(3, 'Steve', 'Stan'),
	(4,'Ayana', 'Roudebush'),
	(5,'Sharri', 'Giron'),
	(6,'Jenniffer', 'Squillante'),
	(7,'Isela', 'Hurwitz'),
	(8,'Yajaira', 'Glen'),
	(9,'Maryjane', 'Pace'),
	(10,'Nicolas', 'Vanwagenen'),
	(11,'Ernestina', 'Tewksbury'),
	(12,'Amiee', 'Williford'),
	(13,'Oliva', 'Felice'),
	(14,'Reed', 'Luque'),
	(15,'Fernando', 'Metayer'),
	(16,'Erna', 'Padillo'),
	(17,'Mozella', 'Foy'),
	(18,'Raye', 'Berlin'),
	(19,'June', 'Bichrest'),
	(20,'Magda', 'Hildreth')
;

INSERT INTO State
	(`stateName`,`state`)
VALUES
	('ALABAMA', 'AL'),
	('ALASKA', 'AK'),
	('ARIZONA', 'AZ'),
	('ARKANSAS', 'AR'),
	('CALIFORNIA', 'CA'),
	('COLORADO', 'CO'),
	('CONNECTICUT', 'CT'),
	('DELAWARE', 'DE'),
	('FLORIDA', 'FL'),
	('GEORGIA', 'GA'),
	('HAWAII', 'HI'),
	('IDAHO', 'ID'),
	('ILLINOIS', 'IL'),
	('INDIANA', 'IN'),
	('IOWA', 'IA'),
	('KANSAS', 'KS'),
	('KENTUCKY', 'KY'),
	('LOUISIANA', 'LA'),
	('MAINE', 'ME'),
	('MARYLAND', 'MD'),
	('MASSACHUSETTS', 'MA'),
	('MICHIGAN', 'MI'),
	('MINNESOTA', 'MN'),
	('MISSISSIPPI', 'MS'),
	('MISSOURI', 'MO'),
	('MONTANA', 'MT'),
	('NEBRASKA', 'NE'),
	('NEVADA', 'NV'),
	('NEW HAMPSHIRE', 'NH'),
	('NEW JERSEY', 'NJ'),
	('NEW MEXICO', 'NM'),
	('NEW YORK', 'NY'),
	('NORTH CAROLINA', 'NC'),
	('NORTH DAKOTA', 'ND'),
	('OHIO', 'OH'),
	('OKLAHOMA', 'OK'),
	('OREGON', 'OR'),
	('PENNSYLVANIA', 'PA'),
	('RHODE ISLAND', 'RI'),
	('SOUTH CAROLINA', 'SC'),
	('SOUTH DAKOTA', 'SD'),
	('TENNESSEE', 'TN'),
	('TEXAS', 'TX'),
	('UTAH', 'UT'),
	('VERMONT', 'VT'),
	('VIRGINIA', 'VA'),
	('WASHINGTON', 'WA'),
	('WEST VIRGINIA', 'WV'),
	('WISCONSIN', 'WI'),
	('WYOMING', 'WY'),
	('GUAM', 'GU'),
	('PUERTO RICO', 'PR'),
	('VIRGIN ISLANDS', 'VI')
;  

INSERT INTO Address 
	(`id`,`number`,`street`,`zipcode`,`city`,`state`)
VALUES
	(1, 734, '6th Avenue','94565', 'Pittsburg', 'CA'),
	(2, 732, 'Cherry Lane','90004', 'Los Angeles', 'CA'),
	(3, 51, '5th Street East','90063', 'Los Angeles', 'CA'),
	(4, 928, 'Cardinal Drive','93906', 'Salinas', 'CA'),
	(5, 666, 'Aspen Drive','91744', 'La Puente', 'CA'),	
	(6 , 165,'Maple Street','42141', 'Glasgow', 'KY'),
	(7 , 317,'11th Street','11731', 'East Northport', 'NY'),
	(8 , 72,'5th Avenue','27540', 'Holly Springs', 'NC'),
	(9 , 327,'6th Street West','37388', 'Tullahoma', 'TN'),
	(10 , 201,'Mill Road','13090', 'Liverpool', 'NY'),
	(11 , 718,'Hawthorne Lane','37072', 'Goodlettsville', 'TN'),
	(12 , 420,'Linden Street','33905', 'Fort Myers', 'FL'),
	(13 , 516,'Lakeview Drive','44146', 'Bedford', 'OH'),
	(14 , 260,'Railroad Street','48504', 'Flint', 'MI'),
	(15 , 71,'Heather Lane','11553', 'Uniondale', 'NY'),
	(16 , 109,'Cambridge Court','21157', 'Westminster', 'MD'),
	(17 , 718,'Aspen Drive','19460', 'Phoenixville', 'PA'),
	(18 , 213,'Railroad Street','01844', 'Methuen', 'MA'),
	(19 , 458,'Warren Avenue','30039', 'Snellville', 'GA'),
	(20 , 610,'Grant Avenue','06450', 'Meriden', 'CT')
;
