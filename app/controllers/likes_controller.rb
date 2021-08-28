class LikesController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def create
    if current_user.nil?
      redirect_to new_user_session_path
    elsif already_liked
      already_liked.destroy
      redirect_to request.referer
    else
      @tweet = Tweet.find(params[:tweet_id])
      @like = @tweet.likes.create(user_id: current_user.id)
      redirect_to request.referer
    end
  end

  # rubocop:enable Metrics/AbcSize
  def index
    @user = User.find(params[:user_id])
    @tweets = @user.liked_tweets
  end

  private

  def already_liked
    Like.where(user_id: current_user.id, tweet_id: params[:tweet_id]).first
  end
end
