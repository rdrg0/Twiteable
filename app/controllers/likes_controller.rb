class LikesController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def create
    if current_user.nil?
      redirect_to root_path
    elsif already_liked
      @like = Like.where(user_id: current_user.id, tweet_id: params[:tweet_id]).first
      @like.delete
    else
      @tweet = Tweet.find(params[:tweet_id])
      @like = @tweet.likes.create(user_id: current_user.id)
    end
    redirect_to request.referer
  end

  # rubocop:enable Metrics/AbcSize
  def index
    @user = User.find(params[:user_id])
    @tweets = @user.liked_tweets
  end

  private

  def already_liked
    Like.exists?(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
