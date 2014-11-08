require 'faker'

module Seed
  # Create Users
  def self.populate
    10.times do
      User.create(email: Faker::Internet.email, password_hash: "password")
    end

    # Create Surveys
    1.times do
      User.all.each do |user|
        user.surveys.create(title: Faker::Lorem.word , description: Faker::Lorem.sentence(3, true, 4))
      end
    end

    # Create Questions
    1.times do
      Survey.all.each do |survey|
        survey.questions.create(question_str: Faker::Lorem.sentence(3, true, 4))
      end
    end

    # Picks
    1250.times do
      Pick.create(user_id: User.all.sample.id, question_id: Question.all.sample.id, answer_number: rand(1..5))
    end
  end
end



