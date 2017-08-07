module SlackCoffeeBot
  module Commands
    class GetStatus < SlackRubyBot::Commands::Base
      command 'hello' do |client, data, _match|
        client.say(channel: data.channel, text: 'Hello! I\'m the coffee bot!')
      end
    end
  end
end