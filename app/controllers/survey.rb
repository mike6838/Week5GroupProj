get '/survey_show/:survey_id' do
  @survey = Survey.all.find(params[:survey_id])
  erb :survey_show
end