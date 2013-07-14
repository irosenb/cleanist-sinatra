require "sinatra"
require "rest_client"

get '/' do
	REDIRECT_URI = 'http://localhost:4567/callback'
	params = {
		:consumer_key => '15466-ce68984d5b15a25a88b85a4c',
		:redirect_uri => REDIRECT_URI
	}

  
end
