class UsersController < ApplicationController
  def edit
  	@recent_foods = client.recent_foods.all
  end

  def show 
    @user = User.find_by_username(params[:id])
    unless @user.authtoken.blank?
      @users = User.paginate(page: params[:page])
      @fitbit_client = Fitgem::Client.new(
        :consumer_key => "d4c64a56227a46a7950cf851f516748e",
        :consumer_secret => "405f2b469313493da01215e1ae10e05e",
        :token => @user.authtoken,
        :secret => @user.secrettoken
      )
      @activity = @fitbit_client.activities_on_date(Date.today.to_s)
      @steps = @activity["summary"]["steps"]
    end
  end

end
