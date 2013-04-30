class CompetitionsController < ApplicationController
  # before_filter :signed_in_user

  def create
    # current_user.compete!(@challenge.id)
    @challenge = Challenge.find(params[:competition][:challenge_id])
    # raise @challenge.inspect
    @challenge.competitions.create!(:competitor_id => current_user.id, :challenge_id => @challenge.id)

    redirect_to @challenge

  end

  def destroy
    @challenge = Challenge.find(params[:id]).competitions
    current_user.uncompete!(@challenge)
    redirect_to @challenge
  end

  def compete!(challenge)
    @challenge.competitions.create!(2)
  end
end