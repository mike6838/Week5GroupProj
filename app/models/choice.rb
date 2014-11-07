class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :picks
  has_many :choices, through: :picks
end