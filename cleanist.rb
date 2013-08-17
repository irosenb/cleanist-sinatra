require "sinatra"
require "rest_client"

get '/' do
	REDIRECT_URI = 'http://localhost:9393/callback'
  $base_url = 'https://getpocket.com/v3/'
  params = {
    :consumer_key => '15466-ce68984d5b15a25a88b85a4c',
    :redirect_uri => REDIRECT_URI
  }
  token_url = 'oauth/request' 
  url = [$base_url, token_url].join

  response = RestClient.post url, 
                        params,
                        :content_type => :json
                        # :accept => :json # this throws a strange 406 error with the RestClient
  
  $code = response.to_str # => code='code', not JSON
  # response.headers 
  $code.slice! "code=" # remove code part
  $code

  redirect "https://getpocket.com/auth/authorize?request_token=#{$code}&redirect_uri=#{REDIRECT_URI}"

end

get '/callback' do
  access_url = 'oauth/authorize'
  url = [$base_url, access_url].join

  params = {
    :consumer_key => '15466-ce68984d5b15a25a88b85a4c',
    :code => $code
  }
  response = RestClient.post url, 
                        params,
                        :content_type => :json
                        # :accept => :json # this throws a strange 406 error with the RestClient

  code = response.to_str
  code 
end






