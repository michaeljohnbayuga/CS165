class User < ApplicationRecord
  has_many :trackers, :dependent => :destroy

  validates :username, presence: :true

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && (user.password == BCrypt::Engine.hash_secret(password, user.salt))
      return user
    else
      return false
    end
  end

end
