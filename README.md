# tweeffy

tweeffy is post my favorite user's tweet to own tumblr application.

## prepair

edit tumblr url in lib/tasks/crawl_tweets.rake

### db

#### set your favolite twitter user to seeds
vi db/seeds.rb
[edit it!]

### if running on Heroku

#### set ENV

````sh
# set rails secret token (use: config/initializers/secret_token.rb)
heroku config:set SECRET_TOKEN=`bundle exec rake secret`

# set twitter auth (use: config/initializers/external_services.rb)
heroku config:set TWITTER_CONSUMER_KEY=XXXXXXXXXXXXXXXXXXXXXX
heroku config:set TWITTER_CONSUMER_SRCRET= XXXXXXXXXXXXXXXXXXXXXX
heroku config:set TWITTER_OAUTH_TOKEN= XXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXX
heroku config:set TWITTER_OAUTH_TOKEN_SECRET= XXXXXXXXXXXXXXXXXXXXXX

# set tumblr auth (use: config/initializers/external_services.rb)
heroku config:set TUMBLR_CONSUMER_KEY= XXXXXXXXXXXXXXXXXXXXXX
heroku config:set TUMBLR_CONSUMER_SRCRET= XXXXXXXXXXXXXXXXXXXXXX
heroku config:set TUMBLR_OAUTH_TOKEN= XXXXXXXXXXXXXXXXXXXXXX
heroku config:set TUMBLR_TOKEN_SECRET= XXXXXXXXXXXXXXXXXXXXXX
````

#### migrate & seed

````sh
heroku run rake db:migrate
heroku run rake db:seed
````

### run

````sh
heroku run rake crawl_tweets
````

RECOMMEND : set Heroku Scheduler https://heroku-scheduler.herokuapp.com/dashboard

## if running on local

### bundle install

run bundle install with favorite options!

### set rails secret token
run rake secret and set result to Tweeffy::Application.config.secret_key_base in config/initializers/secret_token.rb

RECOMMEND: after run git update-index --assume-unchanged  config/initializers/secret_token.rb

### set twitter auth &  tumblr auth 
get consumer key & oauth token and set to config/initializers/secret_token.rb

how to get consumer key & oauth token: see: http://qiita.com/items/ede8f53e2484843da174 and http://qiita.com/items/0088af5aec79b4b0008e (Very very nice entries!!!)

RECOMMEND: after run git update-index --assume-unchanged  config/initializers/external_services.rb

#### migrate & seed

````sh
rake db:migrate
rake db:seed
````

### run
````sh
rake crawl_tweets
````

# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Ruby's License

# Ruby version

2.0.0

# Database

production: pg
development: sqlite3

