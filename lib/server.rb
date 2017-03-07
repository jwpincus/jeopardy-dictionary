require 'sinatra'
require 'sinatra/reloader'
require_relative 'clue_repo'
repo = ClueRepository.new('./data/jeopardy.csv')

get '/jeopardy' do
  answer = ''
  answer = repo.find_all_by_question(@params['question']).join("<br>") if @params['question']
  question = ''
  question = @params['question'] if @params['question']
  erb :jeopardy, :locals => {:answer => answer, :question => question}
end