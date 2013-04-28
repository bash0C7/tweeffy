# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### AdminUser.create(phone_number: '+XXXXXXXXXXXXX')

yufu_bis = TweetUser.create(name: 'yufu_BiS', latest_crawled_tweet_id: 0)
yufu_bis.tumblr_blogs << TumblrBlog.create(name: 'tweeffy')

ajiting = TweetUser.create(name: '#ajiting', latest_crawled_tweet_id: 0)
ajiting.tumblr_blogs << TumblrBlog.create(name: 'ajiting')
