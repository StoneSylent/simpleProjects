Select firstName, lastName, id
From User
Where id In (Select id From Address Where state = 'CA')
;

