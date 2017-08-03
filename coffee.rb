require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require './config/environments' #database configuration
require './models/user'        #User class
require 'slack-ruby-bot'
require './slack-coffeebot/bot'
require './slack-coffeebot/commands/getStatus'


Thread.new do
  begin
    SlackCoffeeBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end


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