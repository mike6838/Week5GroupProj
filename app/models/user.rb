class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :picks
  has_many :choices, through: :picks
  has_many :surveys

  include BCrypt

  def password
    @password ||= Password.new(secure_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.secure_password = @password
  end
end
