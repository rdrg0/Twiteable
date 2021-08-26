class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @user = User.last
  end

  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
    # @new_tweet.replied_to = @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    redirect_to request.referer
  end
end

private

def tweet_params
  params.require(:tweet).permit(:body, :user_id)
end
