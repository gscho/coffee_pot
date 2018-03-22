module SlackCoffeeBot
  class CoffeeBot < SlackRubyBot::Bot
    help do
      title 'Coffee Bot'
      desc 'This bot tells you everything you need to know about the coffee level & temperature.'
      command 'check' do
        desc 'Tells you about the current coffee pot level.'
        long_desc "Provides and update on the current coffee pot level as well as\n" \
          'the temperature of the coffee when applicable.'
      end
    end
  end
end
