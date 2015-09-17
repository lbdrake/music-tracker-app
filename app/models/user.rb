class User < ActiveRecord::Base

validates :email, :session_token, :password_digest, presence: true
validates :email, uniqueness: true

after_initialize :ensure_session_token
attr_reader :password

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def is_password?(password)
  BCrypt::Password.new(self.password_digest).is_password?(password)
end

def reset_session_token!
  @session_token = generate_session_token
  self.save!
end

def self.find_by_credentials(email, password)
  # email_password_hash = email_password
  user = User.find_by_email(email)
  return user if user && user.is_password?(password)
end

private
  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end
end
