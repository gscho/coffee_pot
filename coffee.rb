require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require 'yajl'
require './models/device'
require './models/measurement'
require 'slack-ruby-bot'
require './lib/slack-coffeebot/bot'
require './lib/slack-coffeebot/commands/get_status'

set :database_file, 'config/database.yml'

helpers do
  def authenticate(token)
    ENV['SLACK_API_TOKEN'].eql? token
  end
end

before '/api/*' do
  token = request.env["HTTP_TOKEN"]
  if authenticate(token).eql? false
    halt 401, 'Unable to authenticate!'
  end
end

get '/' do
  erb :dashboard
end

get '/api/devices' do
  content_type :json
  @devices = Device.all
  Yajl::Encoder.encode(@devices)
end

get '/api/device/:id' do |id|
  content_type :json
  @device = Device.find(id)
  @measurements = Measurement.where(device_id: @device.id).limit(10)
  res = { device: @device, measurements: Array(@measurements) }
  Yajl::Encoder.encode(res)
end

post '/api/device/:id/measurements' do |id|
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
