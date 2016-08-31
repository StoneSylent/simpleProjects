class Bookmark < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'user_name'
end
