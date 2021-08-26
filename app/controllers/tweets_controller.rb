class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
  end
end
