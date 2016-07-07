/*start pulling user info*/
SELECT User.firstName, User.lastName, Address.city, Address.state FROM User INNER JOIN Address ON User.id = Address.id;

SELECT User.firstName, User.lastName, Address.city, Address.state FROM User INNER JOIN Address ON User.id = Address.id ORDER BY Address.state ASC;
/* Same  as above*/
Select User.firstName, User.lastName, Address.city, Address.state FROM User, Address WHERE User.id = Address.id ORDER BY Address.state ASC;
/*Full mailing user address*/
Select User.firstName,User.lastName,Address.number,Address.street,Address.city,State.stateName,Address.zipcode 
From User 
INNER JOIN Address ON User.id = Address.id 
INNER JOIN State ON State.state = Address.state;


CREATE VIEW FullAddress AS Select User.firstName,User.lastName,Address.number,Address.street,Address.city,State.stateName,Address.zipcode 
From User JOIN Address ON User.id = Address.id JOIN State ON State.state = Address.state;
