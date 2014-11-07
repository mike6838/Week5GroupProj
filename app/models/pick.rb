class Pick < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question


  # def aggregate_choices(user_id)
  #   agg_choices = []
  #   user = User.find(user_id)
  #   user_surveys = user.surveys
  #   survey_questions = user_surveys.questions
  #   question_choices = survey_questions.choices
  #   agg_choice Picks.where(choice_id: question_choices.id)

  # end




end



def followers
  rels = Following.where(followed_id: self.id)
  followers = []
  rels.each do |rel|
    followers << User.find(rel.follower_id)
  end
  followers
end