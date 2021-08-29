class Api::TweetsController < ApiController
  def index
    @tweets = Tweet.all
    render json: @tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    render json: @tweet
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)

    render json: @tweet
  end

  # delete /tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    head :no_content
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :replied_to_id)
  end
end
