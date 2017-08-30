module SlackCoffeeBot
  module Commands
    class GetStatus < SlackRubyBot::Commands::Base
      command 'hello' do |client, data, _match|
        client.say(channel: data.channel, text: 'Hello! I\'m the coffee bot!')
      end
      command 'test' do |client, data, _match|
        client.say(channel: data.channel, text: "#{client}! #{data} #{_match}")
      end
    end
  end
end
