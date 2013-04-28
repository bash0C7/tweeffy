# To change this template, choose Tools | Templates
# and open the template in the editor.

class PostService
  def tweet_picture_to_blog tweet_user
    tumblr = Tumblr::Client.new
    latest_crawled_tweet_id = tweet_user.latest_crawled_tweet_id

    tweet_user.read_tweets.reverse_each do |tw|
      if latest_crawled_tweet_id.to_i >= tw.id
        Rails.logger.info "skip #{tw.id}"
        next
      end

      if tw.media.size.zero? #and tw.text =~ /^RT\s+/
        Rails.logger.info "no media #{tw.id}"
        next
      end
      
      tw_url = "https://twitter.com/#{tw.user.screen_name}/status/#{tw.id}"
      data_raw = tw.media.map do |m| 
        begin
          open(m.media_url).read
        rescue => e
          Rails.logger.warn "exception #{tw.id} #{tw.text} #{e.to_s} #{m.media_url}"
          next
        end
      end
        
      user.tumblr_blogs.all.each do |tb|
        begin
          tumblr.photo("#{tb.name}.tumblr.com",
            tags: %W(#{tw.user.screen_name}).join(','),
            caption: "“#{tw.text}”(#{tw_url})",
            source: tw_url,
            link: tw_url,
            data_raw: data_raw
          )
          Rails.logger.info "posted #{tb.name} #{tw.id} #{tw.text}"
        rescue => e
          Rails.logger.warn "exception #{tb.name} #{tw.id} #{tw.text} #{e.to_s}"
        end
      end
      latest_crawled_tweet_id = tw.id
      tweet_user.update_attribute(:latest_crawled_tweet_id, latest_crawled_tweet_id)
    end
  end
end
