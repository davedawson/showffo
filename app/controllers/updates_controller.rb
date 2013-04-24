class UpdatesController < ApplicationController
  def create
    @user = current_user
    @challenges = @user.challenges.paginate(page: params[:page])
    @challenge = current_user.challenges.build(params[:challenge])
    @update = @challenge.updates.build
    if @update.save
      flash[:success] = "Challenge updated!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
end