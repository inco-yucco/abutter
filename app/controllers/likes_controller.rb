class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    # いいねした写真の一覧
    @photos = Photo.joins(:likes).where(likes: { user_id: params[:user_id] })
  end

  def create
    current_user.likes.create(photo_id: params[:photo_id])
    # リダイレクト先：写真詳細ページ
    redirect_to [:photo, {id: params[:photo_id] }]
  end

  def destroy
    current_user.likes.find_by(photo_id: params[:photo_id]).destroy
    # リダイレクト先：写真詳細ページ
    redirect_to [:photo, {id: params[:photo_id] }]
  end
end
