class User < ActiveRecord::Base
  attr_reader :password
  validates :password_digest, :session_token, presence: true
  validates :email, presence: true, uniqueness: true
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    session_token = User.generate_session_token
  end

  def ensure_session_token
    session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user && user.password=password
    nil
  end

end
