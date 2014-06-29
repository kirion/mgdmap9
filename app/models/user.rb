class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :admin, :phone
 
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64( n=32 )
  end
  
  def generate_token_reset_at(column)
    self[column] = Time.zone.now
  end
  
  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64( n=32 )
  end
end
