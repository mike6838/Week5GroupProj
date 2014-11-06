class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :picks
  has_many :surveys, through: :picks

end
