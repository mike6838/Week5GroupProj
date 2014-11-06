require 'faker'

module Seed
  # Create Users
  def self.populate
    10.times do
      User.create(email: Faker::Internet.email, password_hash: Faker::Internet.password(8))
    end

    # Create Surveys
    5.times do
      User.all.each do |user|
        user.surveys.create(title: Faker::Lorem.word , description: Faker::Lorem.sentence(3, true, 4))
      end
    end

    # Create Questions
    5.times do
      Survey.all.each do |survey|
        survey.questions.create(question_str: Faker::Lorem.sentence(3, true, 4))
      end
    end

    # Possible Choices
    5.times do
      Question.all.each do |question|
        question.choices.create(choice_str: Faker::Lorem.word)
      end
    end

    # Picks
    1250.times do
      Pick.create(user_id: User.all.sample.id, choice_id: Choice.all.sample.id)
    end
  end
end



