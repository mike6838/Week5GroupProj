class Pick < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users
  has_many :choices
end
