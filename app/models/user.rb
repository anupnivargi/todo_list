class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

  before_save :encypt_password

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user. password_salt)
      user
    else
      nil
    end
  end

  def say(message)
    "#{full_name} says #{message}" 
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def encypt_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



end

