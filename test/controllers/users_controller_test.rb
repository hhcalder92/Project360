require 'test_helper'

class UsersControllerTest < ActionController::TestCase
 test "should create user" do
	  assert_difference('User.count') do
	    post :create, user: {
	    	name: 'tester',
	    	password: 'password',
	    	password_dup: 'password',
	    	email: 'tester@gmail.com',
	    	email_dup: 'tester@gmail.com'
	    }
	  end
	 
	  assert_redirected_to root_url
	end

	test "should get user profile page if signed in" do
		post :create, user: {
	    	name: 'tester',
	    	password: 'password',
	    	password_dup: 'password',
	    	email: 'tester@gmail.com',
	    	email_dup: 'tester@gmail.com'
	    }

    get :show, {id: 1}
    assert_response :success
    assert_template "users/show"
	end

	test "should redirect to sign up page if not signed in" do
		session[:token] = nil
		get :show, {id: 1}
		assert_redirected_to "users/new"
	end
end