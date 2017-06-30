require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/user'        #User class

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

post '/new/user' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/success'
  else
    "Sorry, there was an error!"
  end
end

get '/success' do
	@users = User.all
	erb :success
end