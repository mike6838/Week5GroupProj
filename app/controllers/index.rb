after do
  ActiveRecord::Base.clear_active_connections!
end

get '/' do
  @users = current_user ? User.all : []
  erb :index
end

#--------------SIGN_IN-------------

post '/sessions' do
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session.destroy
  redirect '/'
end

#--------------SIGN_UP------------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end

#------------CREATE_NEW_SURVEY----

get '/surveys/new' do
  erb :new_survey
end

post '/surveys/' do
  @survey = Survey.new(title: params[:title], description: params[:description])

  if @survey.save
    redirect '/'
  else
    p "Survey is not saved!"
    erb :new_survey
  end

end


#----------CREATE_NEW_QUESTIONS---

get '/surveys/:survey_id/questions/new' do
  erb :new_questions
end

post '/surveys/:survey_id/questions' do
  # @question = Question.all
  @survey = Survey.find(params[:survey_id])
  @survey.questions << Question.create(question_str: params[:question_str])


  redirect '/'
end

#---------CREATE_CHOICE-----------

get '/surveys/:survey_id/questions/:question_id/choices/new' do
  erb :new_choices
end

post '/surveys/:survey_id/questions/:question_id/choices' do
  # @choice = Choice.all
  @question = Question.find(params[:question_id])
  @question.choices << Choice.create(choice_str: params[:choice_str])


  redirect '/'
end



#---------TAKE-SURVEY-------------

get '/surveys/:survey_id/take' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.qustions
  @choices = @questions.choices
  erb :take
end

post '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.qustions
  @choices = @questions.choices
  redirect '/'
end

#---------GET_RESULTS-------------

get '/survey/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  erb :results
end