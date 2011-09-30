require 'sinatra'
require 'contacts'

get '/import' do
  erb :import
end

post '/show_contacts' do
  email_provider = params[:email_provider]
  login = params[:login]
  password = params[:password]

  case email_provider
    when "gmail"
      @contacts = Contacts::Gmail.new(login, password).contacts
    when "hotmail"
      @contacts = Contacts::Hotmail.new(login, password).contacts
    when "yahoo"
      @contacts = Contacts::Yahoo.new(login, password).contacts
  end

  erb :show_contacts

end
