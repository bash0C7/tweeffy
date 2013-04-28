class TweetUser < ActiveRecord::Base
  has_and_belongs_to_many :tumblr_blogs
  
  def read_tweets
    if name.first == '#'
      res = Twitter.search(name)
      res.results
    else
      tl = Twitter.user_timeline(name)
      tl
    end
  end
end
