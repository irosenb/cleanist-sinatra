class Pocket < ActiveRecord::Base 
	# def initialize(token, user)
	# 	@auth = {
	# 		:token => token,
	# 		:consumer_key => consumer_key
	# 	}


	# end

	def retrieve(consumer_key) 
		url = "get/"
		pocket_url = join_url(url)
		# time = Time.now.to_i
		token = self.token
		puts consumer_key
		puts time = self.created_at #.to_i
		options = {
			:access_token => token,
			:consumer_key => consumer_key, 
			:since => (time if defined? time)
		}

		hello = RestClient.post pocket_url, options
		# JSON.parse(hello)
	end



	private 
	def base_url
		# Build a base URL for making requests to Pocket.
		base_url = "https://getpocket.com/v"
		version = "3" # If Pocket comes out with a new API version, this will come in handy.
		url = [base_url, version, "/"].join("")
	end

	def join_url(url)
		# Join the base and url 
		[base_url, url].join("")
	end
	
end