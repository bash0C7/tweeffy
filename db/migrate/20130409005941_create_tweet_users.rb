class CreateTweetUsers < ActiveRecord::Migration
  def change
    create_table :tweet_users do |t|
      t.string :name
      t.decimal :latest_crawled_tweet_id

      t.timestamps
    end
  end
end
