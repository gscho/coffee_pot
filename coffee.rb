require 'sinatra'
require 'sinatra/activerecord'
require 'yajl'
require './config/environments'
require './models/user'
require './models/device'
require './models/measurement'
require './lib/json/device_measurements'

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
  @devices = Device.all.includes(:measurements).map(&:measurements).flatten
  Yajl::Encoder.encode(@devices)
end

get '/device/:id' do |id|
  content_type :json
  @device = Device.find(id)
  @measurements = Measurement.where(device_id: @device.id).limit(10)
  object = DeviceMeasurements.new(@device, Array(@measurements))
  Yajl::Encoder.encode(object)
end
