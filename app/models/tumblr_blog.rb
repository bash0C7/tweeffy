class TumblrBlog < ActiveRecord::Base
  has_and_belongs_to_many :tweet_users
end
