class FollowsController < ApplicationController
  before_action :authenticate_user!

  # follow設定
  def create
    current_user.active_relationships.create(target_user_id: params[:user_id])

    redirect_to [:user, { id: params[:user_id] }]
  end

  # follow解除
  def destroy
    current_user.active_relationships.find_by(target_user_id: params[:user_id]).destroy

    redirect_to [:user, { id: params[:user_id] }]
  end


end
