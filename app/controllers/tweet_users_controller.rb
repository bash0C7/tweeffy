class TweetUsersController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => [:post_to_blog]

  
  def post_to_blog
    service = PostService.new
    TweetUser.all.lazy.each do |u|
      service.tweet_picture_to_blog(u)
    end
    
    render :inline => "<%= ''  %>"  
  end
end
