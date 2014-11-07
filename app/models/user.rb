class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :picks
  has_many :choices, through: :picks
  has_many :surveys

end
