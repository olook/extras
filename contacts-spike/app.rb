require 'sinatra'
require 'contacts'

get '/import' do
  erb :import
end

post '/import' do
  email_provider = params[:email_provider]
  login = params[:login]
  password = params[:password]

  case email_provider
    when "gmail"
      Contacts::Gmail.new(login, password)
    when "hotmail"
      Contacts::Hotmail.new(login, password)
    when "yahoo"
      Contacts::Yahoo.new(login, password)
  end

end
