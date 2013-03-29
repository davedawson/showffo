class ChallengesController < ApplicationController
  def index 
  end

  def show 
    @challenges = current_user.challenges.all
    @challenge = current_user.challenges.build
  end

  def new
    @challenges = current_user.challenges.all
    @challenge = current_user.challenges.build
  end

  def create
    @challenge = current_user.challenges.build(params[:challenge])
    if @challenge.save
      flash[:success] = "Challenge created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
end
