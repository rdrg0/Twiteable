class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
     # @new_tweet.replied_to = @tweet
  end

end
