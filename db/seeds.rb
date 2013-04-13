# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
yufu_bis = TweetUser.create(name: 'yufu_BiS', latest_crawled_tweet_id: 0)
tweeffy = TumblrBlog.new(name: 'tweeffy')
#tweeffy.tweet_users << yufu_bis
#yufu_bis.tumblr_blogs << tweeffy 
yufu_bis.tumblr_blogs.create(name: 'tweeffy')
