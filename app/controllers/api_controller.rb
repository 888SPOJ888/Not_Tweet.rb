class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

  def news
    tweets = Tweet.last(50)
    
    hash_result = tweets.map do |t|
      {
        :id  => t.id,
        :content => t.content,
        :user_id => t.user_id,
        :like_count => t.likes.count,
        #:retweet_count => t.count_origin_tweet, 
        #:retweeted_from => (t.origin_tweet_ref.nil? ? "" : t.origin_tweet_ref)
      }
    end

    render json: hash_result
  end
  def tweets_between_dates
    date1 = Date.parse(params[:date1])
    date2 = Date.parse(params[:date2])

    tweets = Tweet.where(created_at: date1..date2)
    hash_result = tweets.map do |t|
      {
        :id  => t.id,
        :content => t.content,
        :user_id => t.user_id,
        :like_count => t.likes.count,
        #:retweet_count => t.count_origin_tweet, 
        #:retweeted_from => (t.origin_tweet_ref.nil? ? "" : t.origin_tweet_ref)
      }
    end

    render json: hash_result
  end

  def create_tweet
    user = User.authenticate(params[:email], params[:password])
    if !user.nil?
      @tweet = Tweet.new(tweet_params)
      @tweet.user = user
      if @tweet.save
        render json: @tweet
      else
        render json: { errors: "error", code: 500}
      end
    else
      render json: { errors: "error with credentials"}
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end


end