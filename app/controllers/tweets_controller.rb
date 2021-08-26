class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @new_tweet = Tweet.new
  end
end

# def create
#   user = User.first  # current_user
# end

private

def tweet_params
  params.require(:tweet).permit(:body)
end
