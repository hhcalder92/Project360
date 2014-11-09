require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test "can create friendship" do
		assert_difference('Friendship.count') do
	    friendship = Friendship.create(id: 1, user_id: 1, friend_id: 2)
			friendship.save!
	  end
	end

	test "cannot create same friendship twice" do
		friendship = Friendship.create(id: 1, user_id: 1, friend_id: 2)
		friendship2 = Friendship.create(id: 2, user_id: 1, friend_id: 2)
		assert_equal "has already been taken", friendship2.errors[:friend_id][0]
	end
end
