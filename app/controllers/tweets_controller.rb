class TweetsController < ApplicationController
  def index; end

  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
  end
end
