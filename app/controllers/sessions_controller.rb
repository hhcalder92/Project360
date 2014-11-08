class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
    params[:user][:name],
    params[:user][:password])
    if @user
      login!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Wrong email or password"]
      render :new 
    end 
  end 
  
  def new 
    if signed_in? 
      redirect_to root_url
    else 
      @user = User.new
      render :new 
    end 
  end 
  
  def destroy
    logout!
    redirect_to new_user_url
  end 
  
  
end
