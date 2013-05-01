class CompetitionsController < ApplicationController
  # before_filter :signed_in_user
  

  def create
    @user = current_user
    # current_user.compete!(@challenge.id)
    @challenge = Challenge.find(params[:competition][:challenge_id])
    # raise @challenge.inspect
    @challenge.competitions.create!(:competitor_id => current_user.id, :challenge_id => @challenge.id)
    redirect_to @challenge

  end

  def destroy
    @challenge = Challenge.find(params[:competition][:challenge_id])
    raise @challenge.inspect
    # current_user.uncompete!(@challenge)
    competitions.find_by_competitor_id(current_user).destroy
    redirect_to @challenge
  end

end