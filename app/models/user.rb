class User < ActiveRecord::Base
  
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :images
  
  attr_reader :password
  validates :name, :password_digest, presence: true 
  validates :password, length: { minimum: 6 , allow_nil: true }
  validates :email, presence: true, uniqueness: true
  validates :name, uniqueness: true

  
    
  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)
    user.try(:is_password?, password)? user : nil 
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end 
  
  def password=(unencrypted_password) 
    if unencrypted_password.present?
      @password = unencrypted_password 
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end
  def reset_session_token! 
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
end
