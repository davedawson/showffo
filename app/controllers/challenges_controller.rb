class ChallengesController < ApplicationController
  def index 
  end

  def show 
    @user = current_user
    # @challenges = @user.challenges.paginate(page: params[:page])
    @challenges = @user.challenges.all
    @challenge = Challenge.find(params[:id])
    #@updates = @challenge.updates.all
    # @updates = @challenge.updates.build
    # @update = @challenge.updates.build
    # @challenges = current_user.challenges.all
    # @challenge = current_user.challenges.build(params[:challenge])
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

  def update
    
  end

  def following
    @title = "Following"
    @challenge = User.find(params[:id])
    @challenges = @challenge.challenged_users.paginate(page: params[:page])
    render 'join'
  end

  def followers
    @title = "Followers"
    @challenge = User.find(params[:id])
    @challenges = @challenge.challenged.paginate(page: params[:page])
    render 'join'
  end

end
