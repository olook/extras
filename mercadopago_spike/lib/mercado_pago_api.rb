require 'curb'
require 'json'

class MercadoPagoAPI

  CLIENT_ID = 2781 
  CLIENT_SECRET = "KOEw1qa9ZyjMr8QrwSZqR1xQk9OSV4hs"

  class << self
  
    def get_init_point(arg)
      access_token = get_oauth_token(CLIENT_ID, CLIENT_SECRET)
      json = arg.to_json
      post_mp = Curl::Easy.http_post("https://api.mercadolibre.com/checkout/preferences?access_token=#{access_token}", json) {|curl| curl.headers['Accept'] = 'application/json'; curl.headers['Content-Type'] = 'application/json'} 
      parse_json = parse(post_mp.body_str)
      parse_json["init_point"]
    end
  
    def get_oauth_token(client_id, client_secret)
      post_mp = Curl::Easy.http_post("https://api.mercadolibre.com/oauth/token?grant_type=client_credentials&client_id=#{client_id}&client_secret=#{client_secret}") {|curl| curl.headers['Accept'] = 'application/json'; curl.headers['Content-Type'] = 'x-www-form-urlencoded'} 
      parse_json = parse(post_mp.body_str)
      parse_json["access_token"]
    end
  
    def parse(json)
      received_json = json 
      parsed_json = JSON.parse(received_json)
      parsed_json
    end

  end

end
