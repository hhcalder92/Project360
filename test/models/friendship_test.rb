require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test "can create friendship" do
		assert_difference('Friendship.count') do
	    friendship = Friendship.create(id: 1, user_id: 1, friend_id: 2)
			friendship.save!
	  end
	end

	test "cannot add same friend twice" do
		friendship = Friendship.create(id: 1, user_id: 1, friend_id: 2)
		friendship.save!
		friendship2 = Friendship.create(id: 2, user_id: 1, friend_id: 2)
		assert_not friendship2.save
	end


end
