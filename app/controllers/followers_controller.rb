class FollowersController < ApplicationController
  def index
    @followers = User.find(params[:user_id]).followers

    @icons = Icon.all
  end
end
