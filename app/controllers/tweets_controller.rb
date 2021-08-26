class TweetsController < ApplicationController
<<<<<<< HEAD
  def index
    @tweets = Tweet.all
=======
  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
>>>>>>> main
  end
end
