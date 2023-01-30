class TalkingSquidsController < ApplicationController
  def index
    @surumes = TalkingSquid.all
  end

  def show
    @surume = TalkingSquid.find(params[:id])
  end

  def new
    @surume = TalkingSquid.new()
  end

  def create
    @surume = TalkingSquid.new(ika_params)
    if @surume.save
      redirect_to talking_squids_path, notice: "また炙ってしまった..."
    else
      render "new"
    end

  end

  def edit
    @surume = TalkingSquid.find(params[:id])
  end

  def update
    @surume = TalkingSquid.find(params[:id])
    @surume.assign_attributes(ika_params)
    if @surume.save
      redirect_to talking_squids_path, notice: "炙りなおしました"
    else
      render "edit"
    end
  end

  def destroy
    @surume = TalkingSquid.find(params[:id])
    @surume.destroy
    redirect_to talking_squids_path, notice: "炙りが過ぎたので消し炭にしました"

  end

  private
  def ika_params
    params.require(:talking_squid).permit(:comment)
  end
end
