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

get '/login' do
  erb :login
end

post '/user' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/success'
  else
    status 400
    body 'Sorry, there was an error!'
  end
end

get '/success' do
	erb :success
end

post '/user/login' do
  erb :dashboard
end
