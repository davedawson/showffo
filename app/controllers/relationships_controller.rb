class RelationshipsController < ApplicationController
  # before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:followed_id]) # ?relationship[follower_id]=1337&relationship[type]=1
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end
end