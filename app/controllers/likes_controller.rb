class LikesController < ApplicationController
  def create
    if current_user.nil?
      redirect_to index_path
    elsif alredy_liked
      flash[:notice] = 'You cannot like two times or more'
    else
      @tweet = Tweet.find(params[:tweet_id])
      @like = @tweet.likes.create(user_id)
    end
  end

  def destroy
    if alredy_liked
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
  end

  def index
    @user = User.find(params[:user_id])
    @tweets = @user.liked_tweets
  end

  private

  def alredy_liked
    Like.exist?(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
