module SlackCoffeeBot
  module Commands
    class CoffeeBotCommands < SlackRubyBot::Commands::Base
      command 'check' do |client, data, _match|
        client.say(channel: data.channel, text: 'I\'m not able to check the coffee pot yet!')
      end
      command 'subscribe' do |client, data, _match|
        client.say(channel: data.channel, text: "Hi <@#{data.user}>, you've subscribed for coffee updates!", gif: 'understand')
      end
      command 'unsubscribe' do |client, data, _match|
        client.say(channel: data.channel, text: "<@#{data.user}>, you've unsubscribed from coffee updates", gif: 'understand')
      end
    end
  end
end
