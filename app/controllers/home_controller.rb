class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    # current_user(ログインしているユーザー)のidと、current_userがフォローしているユーザのids(following_idsで取得できる)
    # following_idsは配列なので、*でcurrent_user.idと同じ配列に展開して渡す
    @feeds = Photo.where(user_id: [current_user.id, *current_user.following_ids]).order(created_At: :desc)

    @posts = Photo.all.order(created_at: :desc)
  end


end
