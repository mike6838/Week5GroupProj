class Pick < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :choice
end
