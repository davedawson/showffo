class CompetitionsController < ApplicationController
  # before_filter :signed_in_user

  def create
    @challenge = Challenge.find(2)
    @challenge.compete!(@challenge)
    redirect_to @challenge
  end

  def destroy
    @challenge = Challenge.find(params[:id]).challenged
    @challenge.uncompete!(@challenge)
    redirect_to @challenge
  end
end