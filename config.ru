$LOAD_PATH.push File.expand_path("./lib", __FILE__)

require "./coffee"

Thread.new do
  begin
    SlackCoffeeBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run Sinatra::Application
