class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
  end
end
