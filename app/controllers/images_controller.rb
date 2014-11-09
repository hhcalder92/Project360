class ImagesController < ApplicationController
  def create
    @image = current_user.images.create(image_params)
    if @image.save!
      redirect_to user_url(current_user)
    else
      fail
      flash[:errors] = "Could not upload image."
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update_attributes({ filepicker_url: params[:image][:filepicker_url] })
    redirect_to user_url(current_user)
  end

  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_url(current_user)
  end
  
  def image_params
    params.require(:image).permit(:user_id, :filepicker_url)
  end
end
