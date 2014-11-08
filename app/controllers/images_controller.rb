class ImagesController < ApplicationController
  def create
    if !params[:image][:url]
      flash[:errors] << "Please enter an image url"
    else
      @image = current_user.images.create(image_params)
    end
    redirect_to user_url(current_user)
    return
  end
  
  def destroy
    
  end
  
  def image_params
    params.require(:image).permit(:user_id, :url)
  end
end
