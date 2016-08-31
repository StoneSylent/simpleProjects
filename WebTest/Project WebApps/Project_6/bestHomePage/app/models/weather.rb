class Weather < ActiveRecord::Base
	validates :location, presence: true, uniqueness: true
	
	validates :high, presence: true
	validates :low, presence: true
	validates :condition, presence: true
	validates :wind_speed, presence: true
  validates :loc_name, presence: true
  validates :sunrise, presence: true
  validates :sunset, presence: true
  has_many :users
end
