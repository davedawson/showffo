class UsersController < ApplicationController
  def edit
	@recent_foods = client.recent_foods.all
  end
end
