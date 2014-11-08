class Image < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true, uniqueness: true
  validates :url, presence: true
end
