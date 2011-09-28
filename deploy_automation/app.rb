require 'sinatra'
require 'json'

post '/deploy' do
  json = JSON.parse(params[:payload])
  if json[:message].include?("DEPLOY")
  end
end
