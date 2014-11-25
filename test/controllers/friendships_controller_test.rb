require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  test "cannot add friends without signing up" do
  	@user1 = User.create(id: 3, name: "Jimmy", email: "jimmy@gmail.com", password: "hailjimmy")
  	@user2 = User.create(id: 4, name: "Jo", email: "joe@gmail.com", password: "joeiscool" )

  	post :create, id: 3, friendship: {
  		friend_id: @user1.id,
  		user_id: @user2.id
  	}
  	assert_response 302
  end
end
