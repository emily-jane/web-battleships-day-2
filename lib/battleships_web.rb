require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
	set :views, Proc.new { File.join(root, "..", "views") }

	enable :sessions

  get '/' do
    'Hello BattleshipsWeb!'
    erb :index
  end

  get '/register' do
		erb :register
  end

  post '/register' do
		@name = session[:name]
	  redirect '/register' if @name == ''
		redirect '/game'
  end

  get '/game' do
  	session[:game] = Game.new Player, Board
  	erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
