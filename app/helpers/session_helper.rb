module SessionHelper
  
  def login_required
    redirect_to new_user_url if !signed_in?
  end
  
   
  def current_user 
    @current_user ||= User.find_by_session_token( session[:token])
  end
  
  def signed_in?
    !!current_user
  end
  
  def logout! 
    current_user.try(:reset_session_token!)
    session[:token] = nil
  end 
  
  def login!(user)
    @current_user = user 
    session[:token] = user.reset_session_token! 
  end 
  
end
