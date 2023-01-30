class IconsController < ApplicationController
  def index
    @icons = Icon.all
  end

  def show
    @icon = Icon.find(params[:id])
  end

  def new
    @icon = Icon.new()
  end

  def create
    @icon = Icon.new(icon_params)
    if @icon.save
      redirect_to edit_user_path(current_user)
    else
      render "new"
    end

  end

  def edit
    @icon = Icon.find(params[:id])
  end

  def update
    @icon = Icon.find(params[:id])
    @icon.assign_attributes(icon_params)
    if @icon.save
      redirect_to icon_path(@icon), notice: "炙り直しました"
    else
      render "edit"
    end
  end

  def destroy
    @icon = Icon.find(params[:id])
    @icon.destroy
    redirect_to icons_path, notice: "あの炙りは永久追放です" 
  end

  # ストロングパラメータ
  def icon_params
    params.require(:icon).permit(:content, :icon_image)
  end

end
