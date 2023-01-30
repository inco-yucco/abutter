class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    # 写真のデータを取得する(idではなく、:photo_idであることに注意)
    @photo = Photo.find(params[:photo_id])
    # current_userのコメント作成
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      # commentをsaveできたら写真の詳細ページへ飛ぶ
      redirect_to [@photo]
    else
      # 保存に失敗したら、写真の詳細ページをレンダリングする
      render "photos/show"
    end
  end

  def destroy
    # idからコメントのレコードを取得する
    comment = current_user.comments.find(params[:id])
    comment.destroy

    # photo_idをもとに、写真の詳細ページへリダイレクトさせる
    redirect_to [:photo, { id: params[:photo_id] }]
  end

  private
  # comment_paramsの定義
  def comment_params
    # どの写真にコメントしたかをマージする
    params.require(:comment).permit(:body).merge(photo_id: params[:photo_id])
  end

end
