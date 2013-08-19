ENV['RACK_ENV'] = 'test'

require "../app"
require "test/unit"
require "rack/test"
require "../lib/pocket"

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

	def test_made_by_section
		get '/'
		assert(last_response.body.include?('crafter'), "Add created by section.")
	end
end

class PocketTest < Test::Unit::TestCase
	include Rack::Test::Methods
	
	def app
		Cleanist::Pocket
	end

	def test_pocket_working
		pocket_name = Pocket.new
		pocket_name = pocket_name.class.name
		puts pocket_name
		assert_equal("Pocket", pocket_name, "Pocket not working")
	end
	
end
