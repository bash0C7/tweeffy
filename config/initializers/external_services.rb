require 'twitter'
gem 'tumblr_client'

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SRCRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

Tumblr.configure do |config|
  config.consumer_key = ENV['TUMBLR_CONSUMER_KEY']
  config.consumer_secret = ENV['TUMBLR_CONSUMER_SRCRET']
  config.oauth_token = ENV['TUMBLR_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TUMBLR_TOKEN_SECRET']
end
