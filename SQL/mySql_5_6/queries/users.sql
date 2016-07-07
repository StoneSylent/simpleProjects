/*start pulling user info*/
SELECT User.firstName, User.lastName, Address.city, Address.state FROM User INNER JOIN Address ON User.id = Address.id;

