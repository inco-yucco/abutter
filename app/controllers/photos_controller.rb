class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index 
    @posts = Photo.all.order(created_at: :desc)
  end

  def show
    # 写真情報をデータベースから取得して
    @photo = Photo.find(params[:id])
    # コメント投稿用
    @comment = Comment.new
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      # 保存したらユーザ画面に飛ばす
      redirect_to user_path(current_user)
    else
      # 保存に失敗したらnew画面を表示
      render "new"
    end

  end

  # ストロングパラメータ
  private
  def photo_params
    params.require(:photo).permit(:caption, :image)
  end



end
