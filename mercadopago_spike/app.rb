require 'sinatra'
require './lib/mercado_pago_api.rb'
require 'ruby-debug'
require 'json'

configure do
  enable :sessions
end

get '/' do
  erb :index
end

get '/product/:id' do

  if params[:id] == "1"
    @id = 1
    @title = "Coconut"
    @description = "The term coconut can refer to the entire coconut palm, the seed, or the fruit, which is not a botanical nut."
    @unit_price = 0.01
    @currency_id = "BRL"

    @buyer_name = "John"
    @buyer_surname = "Doe"
    @buyer_email = "wheel@zan.st"

    @success_url = "http://192.168.32.134:4567/success"
    @pending_url = "http://192.168.32.134:4567/pending"

    @quantity = 1

    @external_reference = "OPERATION-ID-0001"
  end

  session[:product] = {"external_reference" => @external_reference, "items"=>[{"id"=>@id, "title"=>@title, "description"=>@description, "unit_price"=>@unit_price, "currency_id"=>@currency_id, "picture_url"=>"http://192.168.32.134:4567/images/coconut.jpg", "quantity"=>@quantity}], "payer"=>{"name"=>@buyer_name, "surname"=>@buyer_surname, "email"=>@buyer_email}, "back_urls"=>{"success"=>@success_url, "pending"=>@pending_url}}
    
  erb :show_product
end

post '/product/:id/buy' do
  @preferences_uri = MercadoPagoAPI.get_init_point(session[:product])
  erb :buy_product
end

