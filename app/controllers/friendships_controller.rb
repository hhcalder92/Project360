class FriendshipsController < ApplicationController
  def create
    @user = current_user
    friendship = @user.friendships.create(friendship_params)
    redirect_to user_url(User.find(friendship.friend_id))
    return
  end
  
  def destroy
    
  end
  
  def friendship_params
    params.require(:friendship).permit(:friend_id, :user_id)
  end
end
