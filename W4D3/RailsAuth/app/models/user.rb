# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  attr_reader :password

  before_validation :ensure_session_token
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token #return the new token
  end

  def ensure_session_token
    # we must be sure to use the ||= operator instead of = or ||, otherwise
    # we will end up with a new session token every time we create
    # a new instance of the User class. This includes finding it in the DB!
    self.session_token ||= self.class.generate_session_token
  end
end
