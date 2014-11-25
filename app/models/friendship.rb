class Friendship < ActiveRecord::Base
  belongs_to :user
  
  belongs_to :friend,
    class_name: "User",
    foreign_key: "friend_id"
  
  validates :user_id, uniqueness: { scope: :friend_id }
end
