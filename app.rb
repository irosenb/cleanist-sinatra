require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Cleanist
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
      use Rack::Session::Cookie
      use OmniAuth::Strategies::Developer
    end

    use OmniAuth::Builder do 
      provider :pocket, '15466-ce68984d5b15a25a88b85a4c' # 'http://localhost:9393/callback'
    end

    #database
    set :database, "sqlite3:///database.db"

    #filters

    #routes
    get '/' do
      haml :index
    end

    get '/auth/pocket/callback' do
      puts env['omniauth.auth']
      key = '15466-ce68984d5b15a25a88b85a4c'
      auth = env['omniauth.auth']
      @token = auth[:credentials][:token]
      @user = auth[:info][:name]

      pocket = Pocket.new(token: @token, user: @user)
      # time = Time.now.to_i
      @hello = pocket.retrieve(key)
      @time = pocket.created_at
      # options = {:consumer_key => key, :access_token => @token}
      # @hello = RestClient.post 'https://getpocket.com/v3/get', options
      haml :callback
    end

    #helpers
    helpers do
      def partial(file_name)
        haml file_name, :layout => false
      end
    end

  end
end
