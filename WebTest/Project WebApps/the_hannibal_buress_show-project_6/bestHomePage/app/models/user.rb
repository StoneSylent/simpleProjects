class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :location, allow_blank: false, format: {
  	with: %r{\A\d{5}\z}i,
  	message: 'must be a 5 digit zipcode.' }
  	#rename location to zip_code?
  has_secure_password
  validates :password, length: { minimum: 6 } 
  #tried to make a regex for password, didn't seem to work.
   has_many :bookmarks
   has_one :settings
   has_one :note
   belongs_to :weather
end
