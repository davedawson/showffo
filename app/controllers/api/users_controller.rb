class Api::UsersController < ApplicationController

  def show
    @user = Fitbit::User.new(current_user)
  end

  def fitbit_data
      raise "Account is not linked with a Fitbit account" unless linked?
      @client ||= Fitgem::Client.new(
                :consumer_key => ENV["d4c64a56227a46a7950cf851f516748e"],
                :consumer_secret => ENV["405f2b469313493da01215e1ae10e05e"],
                :token => oauth_token,
                :secret => oauth_secret,
                :user_id => uid
              )
  	end
end