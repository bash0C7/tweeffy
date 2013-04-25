
desc 'crawl tweets, read picture by tweet media url and post to Tumblr'
task :crawl_tweets => :environment do
  tumblr = Tumblr::Client.new

  logger = Logger.new(STDOUT)

  TweetUser.all.each do |user|
    next if user.name.first == '#'
    
    latest_crawled_tweet_id = user.latest_crawled_tweet_id
    tl = Twitter.user_timeline(user.name)
  
    tl.reverse_each do |tw|
      if latest_crawled_tweet_id.to_i >= tw.id
        logger.info "skip #{tw.id}"
        next
      end

      if tw.media.size.zero? #and tw.text =~ /^RT\s+/
        logger.info "no media #{tw.id}"
      else
        tw_url = "https://twitter.com/#{user.name}/status/#{tw.id}"
        data_raw = tw.media.map do |m| 
          begin
            open(m.media_url).read
          rescue => e
            logger.warn "exception #{tw.id} #{tw.text} #{e.to_s} #{m.media_url}"
            next
          end
        end
        
        user.tumblr_blogs.all.each do |tb|
          begin
            tumblr.photo("#{tb.name}.tumblr.com",
              #        state: 'draft',
              tags: %W(#{user.name}).join(','),
              caption: "“#{tw.text}”(#{tw_url})",
              source: tw_url,
              link: tw_url,
              data_raw: data_raw
            )
          rescue => e
            logger.warn "exception #{tb.name} #{tw.id} #{tw.text} #{e.to_s}"
            next
          else
            logger.info "posted #{tb.name} #{tw.id} #{tw.text}"
          end
        end
      end
      latest_crawled_tweet_id = tw.id
      user.update_attribute(:latest_crawled_tweet_id, latest_crawled_tweet_id)
    end
  end
end
  
desc 'crawl hashtagd tweets , read hashtaged tweet message and post to Tumblr'
task :crawl_hashtagd_tweets => :environment do
  tumblr = Tumblr::Client.new

  logger = Logger.new(STDOUT)

  TweetUser.all.each do |user|
    next unless user.name.first == '#'


    latest_crawled_tweet_id = user.latest_crawled_tweet_id
    tl = Twitter.search(user.name)

    tl.results.reverse_each do |tw|
      if latest_crawled_tweet_id.to_i >= tw.id
        logger.info "skip #{tw.id}"
        next
      end
binding.pry
      if tw.media.size.zero? #and tw.text =~ /^RT\s+/
        logger.info "no media #{tw.id}"
      else
        tw_url = "https://twitter.com/#{tw.user.screen_name}/status/#{tw.id}"
        data_raw = tw.media.map do |m| 
          begin
            open(m.media_url).read
          rescue => e
            logger.warn "exception #{tw.id} #{tw.text} #{e.to_s} #{m.media_url}"
            next
          end
        end
        
        user.tumblr_blogs.all.each do |tb|
          begin
            tumblr.photo("#{tb.name}.tumblr.com",
              #        state: 'draft',
              tags: %W(#{tw.user.screen_name}).join(','),
              caption: "“#{tw.text}”(#{tw_url})",
              source: tw_url,
              link: tw_url,
              data_raw: data_raw
            )
          rescue => e
            logger.warn "exception #{tb.name} #{tw.id} #{tw.text} #{e.to_s}"
            next
          else
            logger.info "posted #{tb.name} #{tw.id} #{tw.text}"
          end
        end
      end
      latest_crawled_tweet_id = tw.id
      user.update_attribute(:latest_crawled_tweet_id, latest_crawled_tweet_id)
    end
  end
end