class User < ApplicationRecord
  has_many :trackers, :dependent => :destroy
  has_many :favorites
  has_many :favorite_shows, through: :favorites, source: :show
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  before_create :encrypt_password
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
