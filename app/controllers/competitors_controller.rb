class CompetitorsController < ApplicationController
  # before_filter :signed_in_user

  def create
    # @challenge = Challenge.find(params[:competition][:competitor_id])
    # compete!(@challenge.id)
    @challenge = Challenge.find(params[:id])
    @challenge.competitors.create!(@challenge)
    redirect_to @challenge
  end

  def destroy
    @challenge = Challenge.find(params[:id]).competitor
    current_user.uncompete!(@challenge)
    redirect_to @challenge
  end

  def compete!(challenge)
    @challenge.competitors.create!(2)
  end
end