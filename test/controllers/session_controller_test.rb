require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  def setup
  	@controller = SessionsController.new
  end

  test "should allow user login" do
  	@user = User.create(id: 3, name: "Jimmy", email: "jimmy@gmail.com", password: "hailjimmy")
  	post :create, user: {
  		name: @user.name,
  		password: @user.password
  	}
  	assert_redirected_to root_url
  end
  
  test "should allow user logout" do
  	@user = User.create(id: 3, name: "Jimmy", email: "jimmy@gmail.com", password: "hailjimmy")
  	post :create, user: {
  		name: @user.name,
  		password: @user.password
  	}
  	assert_redirected_to root_url
  	post :destroy, id: 3
  	assert_redirected_to new_user_url
  end

  test "should redirect from sign up page if logged in" do
  	@user = User.create(id: 3, name: "Jimmy", email: "jimmy@gmail.com", password: "hailjimmy")
  	get :new
  	assert_redirected_to root_url
  end
end
