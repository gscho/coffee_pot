$LOAD_PATH.push File.expand_path("./lib", __FILE__)

require "./coffee"
require 'dotenv'
Dotenv.load

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackCoffeeBot::CoffeeBot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run Sinatra::Application
