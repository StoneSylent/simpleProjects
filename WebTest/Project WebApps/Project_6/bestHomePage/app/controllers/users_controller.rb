require 'json'
require 'net/http'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:user_name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        s = Setting.new user_name: "#{@user.user_name}", background: "gray", fontSize: 8, fontColor: "black", fontFamily: "Arial"
        s.save
        
        4.times do 
          b = Bookmark.new user_name: "#{@user.user_name}", url: "#", title: "+"
          b.save
        end
        
        n = Note.new user_name: "#{@user.user_name}", note: ""
        n.save
        session[:user_id] = "#{@user.user_name}"  
        
        if (!Weather.find_by(@user.location)) #if weather does not exist create it.
		      @url = URI('http://api.openweathermap.org/data/2.5/weather?zip=' + @user.location.to_s + ',us')
	  	  	@result = Net::HTTP.get(@url)
	  	  	@w_hash = JSON.parse(@result)
	  	  	if ((@w_hash["cod"] <=> "404") == 0) #not a city
	  	  		format.html { redirect_to new_user_path, notice: 'Not a valid zipcode location' }
	  	  	else
	  	  		s = Weather.new location: @user.location.to_s, 
	  	  						high: (@w_hash["main"]["temp_max"]- 273.15)* 1.8000 + 32, #convert from kelvin to f. 
	  	  						low:  (@w_hash["main"]["temp_min"]- 273.15)* 1.8000 + 32, #convert from kelvin to f. 
	  	  						condition: @w_hash["weather"][0]["main"],
	  	  						wind_speed: @w_hash["wind"]["speed"], 
	  	  						loc_name: @w_hash["name"], 
	  	  						sunrise: @w_hash["sys"]["sunrise"], 
	  	  						sunset: @w_hash["sys"]["sunset"]
	  	  		s.save
	  	  	end
        end

        format.html { redirect_to main_home_path, notice: "User #{@user.user_name} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to main_home_path, notice: "User #{@user.user_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  #destroy does not seem to work.
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation, :location)
    end
end
