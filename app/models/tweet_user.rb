class TweetUser < ActiveRecord::Base
  has_and_belongs_to_many :tumblr_blogs
end
