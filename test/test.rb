ENV['RACK_ENV'] = 'test'

require "../app"
require "test/unit"
require "rack/test"

class CleanistTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Cleanist::App
	end
	
	def test_front_page
		get '/'
		assert last_response.ok?
	end

	def test_front_page_needs_description
		get '/'
		assert(last_response.ok?, "Page failure")
		assert(last_response.body.include?('description'), "No description.")
	end

	def test_Pocket_working
		pocket_name = 
		assert_equal("Pocket", actual)
	end
end