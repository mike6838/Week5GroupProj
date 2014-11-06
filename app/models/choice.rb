class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many :picks
  has_many :choices, through: :picks
end