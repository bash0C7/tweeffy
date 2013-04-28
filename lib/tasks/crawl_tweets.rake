
desc 'crawl tweets, read picture by tweet media url and post to Tumblr'
task :crawl_tweets => :environment do
  service = PostService.new
  TweetUser.all.lazy.each do |user|
    service.tweet_picture_to_blog user
  end
end