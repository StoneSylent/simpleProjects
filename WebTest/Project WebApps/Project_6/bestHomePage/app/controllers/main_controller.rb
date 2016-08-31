require 'json'
require 'net/http'
class MainController < ApplicationController

  
  
  def home
  	@user = User.find_by(user_name: session[:user_id])
  	if (@user)
  		@location = @user.location #user exists
  	
  	
	  	@note = Note.find_by(user_name: session[:user_id]).note
	  	@bookmark = Bookmark.where(user_name: session[:user_id])
	  	
	  	@weather = Weather.find_by location: @location
	  	@time = Time.now.hour * 100 + Time.now.min
	  	if (@weather)
	  	@weather_time = ((@weather.updated_at.to_formatted_s[11] + @weather.updated_at.to_formatted_s[12]) * 100 + 
	  	    (@weather.updated_at.to_formatted_s[14] + @weather.updated_at.to_formatted_s[15])).to_i
	  	@time = @time - @weather_time
	  	if @time > 100
		  	  # has been more than one hour since weather was updated 
		  	@url = URI('http://api.openweathermap.org/data/2.5/weather?zip=' + @location.to_s + ',us')
			  @result = Net::HTTP.get(@url)
			  @w_hash = JSON.parse(@result)
			  s = Weather.new location: @user.location.to_s,  high: @w_hash["main"]["temp_max"],
			    low: @w_hash["main"]["temp_min"], condition: @w_hash["weather"][0]["main"],	wind_speed: @w_hash["wind"]["speed"],
			    loc_name: @w_hash["name"], sunrise: @w_hash["sys"]["sunrise"], sunset: @w_hash["sys"]["sunset"]
			  s.save
			end
	  	end   
  	end
  end
  

  def update_note

@note = Note.find_by(user_name: session[:user_id])

  if @note.update_attributes(params[:note])
    format.html { redirect_to @note, :notice => 'Note was successfully updated.' }
    @updated = "true"
    format.js
  else
    format.html { render :action => "edit" }
    @updated = "false"
    format.js
  end
 end  

  
end
