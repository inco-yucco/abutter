class FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:user_id]).followings

    @icons = Icon.all
    
  end

end
