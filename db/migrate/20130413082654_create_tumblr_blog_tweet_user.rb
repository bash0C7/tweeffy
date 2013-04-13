class CreateTumblrBlogTweetUser < ActiveRecord::Migration
  def change
    create_table :tumblr_blogs_tweet_users, :id => false do |t|
      t.references :tumblr_blog
      t.references :tweet_user
    end
  end
  
  def down
    drop_table :tumblr_blogs_tweet_users
  end
end
