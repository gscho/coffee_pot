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

get '/device/:id' do |id|
  content_type :json
  @device = Device.find(id)
  @measurements = Measurement.where(device_id: @device.id).limit(10)
  res = { device: @device, measurements: Array(@measurements) }
  Yajl::Encoder.encode(res)
end

post '/device/:id/measurements' do |id|
  content_type :json
  res = Yajl::Parser.parse(request.body.read)
  @measurements = res['measurements'].map{ |e|
    e['device_id'] = id
    Measurement.new(e)
  }
  Measurement.transaction do
    @measurements.map(&:save!)
  end
  status 202
end
