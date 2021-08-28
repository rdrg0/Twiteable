class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @user = current_user
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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to root_path
  end

  # delete /tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to '/tweets'
  end
end

private

def tweet_params
  params.require(:tweet).permit(:body, :user_id)
end
