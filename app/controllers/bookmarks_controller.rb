class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    # bookmarkした写真の一覧
    @photos = Photo.joins(:bookmarks).where(bookmarks: { user_id: params[:user_id] })
  end

  def create
    current_user.bookmarks.create(photo_id: params[:photo_id])
    # リダイレクト先：写真詳細ページ
    redirect_to [:photo, {id: params[:photo_id] }]
  end

  def destroy
    current_user.bookmarks.find_by(photo_id: params[:photo_id]).destroy
    # リダイレクト先：写真詳細ページ
    redirect_to [:photo, {id: params[:photo_id] }]
  end
  
end
