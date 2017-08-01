require 'sinatra'
require 'sinatra/activerecord'
require 'yajl'
require './config/environments'
require './models/user'
require './models/device'
require './models/measurement'

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

get '/devices' do
  content_type :json
  @devices = Device.all
  Yajl::Encoder.encode(@devices)
end

get '/device/:id' do
  content_type :json
  @device = Device.find_by(:id, params[:id])
  Yajl::Encoder.encode(@device)
end
