# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

User.create!(	user_name: 'Stonesylent',
				password_digest: 'notreal',
				location: '43228' )
# . . .
User.create!(	user_name: 'bob',
				password_digest: 'newpassword',
				location: '12345' )
								
