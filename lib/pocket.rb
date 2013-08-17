class Pocket < ActiveRecord::Base 
	# def initialize(token, user)
	# 	# @auth = {
	# 	# 	:token => token,
	# 	# 	:consumer_key => consumer_key
	# 	# }


	# end

	def retrieve
		# Add a link in Pocket. Check out the Pocket API website to see what params 
		# it takes. 
		url = "get/"
		join_url(url)
		
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