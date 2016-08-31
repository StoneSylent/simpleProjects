require 'test_helper'

class UserTest < ActiveSupport::TestCase
#Author: Brandon Stone
  test "Users attributes must not be empty" do
	  user = User.new
	  assert user.invalid?
	  assert user.errors[:user_name].any?
	  assert user.errors[:password].any?
	  assert user.errors[:location].any?
  end 

	def new_user(zip_code)
		User.new( 	user_name: 'stone',
					password: 'things',
					location:  zip_code )	
	end
	
	test "zip_code" do
		pass = Array(12345..12350)
		fail = Array(1..9)
	
		pass.each do |zip|
			assert new_user(zip).valid?, "#{zip} should be valid"
		end
		fail.each do |zip|
			assert new_user(zip).invalid?, "#{zip} should be invalid"
		end
	end
#-----
	
end
