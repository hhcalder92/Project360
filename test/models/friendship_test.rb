require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test "can create friendship" do
		assert_difference('Friendship.count') do
	    friendship = Friendship.create(id: 1, user_id: 1, friend_id: 2)
			friendship.save!
	  end
	end
end
