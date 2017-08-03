# coffee_pot 
[![Build Status](https://travis-ci.org/gscho/coffee_pot.png)](https://travis-ci.org/gscho/coffee_pot)

* [Install Ruby](http://lmgtfy.com/?q=how+to+install+ruby)

* Follow this guide to create a bot user https://github.com/dblock/slack-ruby-bot/blob/master/TUTORIAL.md#create-a-bot-user

* Create file `.env` and place the Slack API token inside 

```
SLACK_API_TOKEN='insert token here'
```

* run `gem install bundler`

* run `bundle install`

* run `ruby coffee.rb`

## Add More Commands

Add more commands in `slack-coffeebot/commands`. You can modify the existing files or add more. Make sure you include the new files in `coffee.rb`.

## Bot Usage

Invite the bot to a channel via `/invite [bot name]` and send it a command with `[bot name] hello`. It will respond with a welcome message.