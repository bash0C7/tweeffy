class TweetUsersController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => [:post_to_blog, :status]

  before_filter :should_admin_user, :only => [:post_to_blog]
  after_filter :write_params_to_log, :only => [:status, :show]
  
  def post_to_blog
    service = PostService.new
    TweetUser.all.lazy.each do |u|
      service.tweet_picture_to_blog(u)
    end
    
    render :inline => '<Response><Reject /></Response>' #"<%= '' %>"  
  end

  def status
    render :inline => '<Response><Reject /></Response>' #"<%= '' %>"  
  end

  def show
    render :inline => '<Response><Reject /></Response>' #"<%= '' %>"  
  end
  
  private 
  def should_admin_user
    logger.info params.to_s
    puts params.to_s
    raise "#{params['Caller']} is not registered" unless AdminUser.exists?(phone_number: params['Caller'])
  end

  def write_params_to_log
    puts params.to_s
  end
end