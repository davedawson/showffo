class StaticPagesController < ApplicationController
  respond_to :json, :html
  require 'json'

  def home
    if signed_in?
      # unless current_user.authtoken.blank?
        @user = current_user if signed_in?
        client = Fitgem::Client.new(
          :consumer_key => "d4c64a56227a46a7950cf851f516748e",
          :consumer_secret => "405f2b469313493da01215e1ae10e05e",
          :token => current_user.authtoken,
          :secret => current_user.secrettoken
        )
        # client = Fitgem::Client.new( :consumer_key => "d4c64a56227a46a7950cf851f516748e", :consumer_secret => "405f2b469313493da01215e1ae10e05e")
        # client = Fitgem::Client.new(:consumer_key => "d4c64a56227a46a7950cf851f516748e", :consumer_secret => "405f2b469313493da01215e1ae10e05e")
        # @body = client.log_body_measurements(:date => 'today', :weight => 160)
        @activity = client.activities_on_date(Date.today.to_s)
        #@steps = client.activities_on_date('2013-03-19').data["distances"]["steps"]
        # @token = current_user.secrettoken
        # @auth = current_user.authtoken
        @steps = @activity["summary"]["steps"]
      # end
        @user_url = /users/#{@user.username}
  	end
    #	@parsed_json = JSON.parse(@activity)
  	#parsed_json[1]["distances"]["steps"]
      #@body_measurements = new FitgemClient.Models.BodyMeasurements()
      # @recent_foods = client.recent_foods.all
  end

  def help
  end
end
