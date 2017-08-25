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

get '/' do
  puts ENV.inspect
  puts :database_file.inspect
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
