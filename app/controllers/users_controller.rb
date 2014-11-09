class UsersController < ApplicationController
  before_filter :login_required, only: :show 
	def create
    if check_params[:password] != check_params[:password_dup]
      flash.now[:errors] << "Passwords do not match"
      render :new
      return
    end
    
    if check_params[:email] != check_params[:email_dup]
      flash.now[:errors] << "Emails do not match"
      render :new
      return
    end
        
    @user = User.new(user_params)
    
    if @user.save
	    login!(@user)
	    redirect_to root_url
	  else
	    flash.now[:errors] = @user.errors.full_messages
	    render :new
	  end
  end
  
  def new
    if signed_in?
      redirect_to user_url(current_user)
    else
      @user = User.new
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    if signed_in?
    render :show
  else
    redirect new_user_url 
  end
  end
  
  def destroy
    logout!
    redirect_to root_url
  end

  def edit
    @user = current_user
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if check_params[:password] != check_params[:password_dup]
      flash.now[:errors] = "Passwords do not match"
      render :edit
      return
    end
    @user.update_attributes(attr_params)
    redirect_to user_url(current_user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
  def check_params
    params.require(:user).permit(:name, :password, :password_dup, :email, :email_dup)
  end

  def attr_params
    params.require(:user).permit(:name, :email, :password, :bio);
  end
  

end
