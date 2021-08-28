class Api::TweetsController < ApiController
  def index
    @tweets = Tweet.all
    render json: @tweets
    # @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet
    # @new_tweet = Tweet.new
    # @new_tweet.replied_to = @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    render json: @tweet
    # authorize @tweet
    # redirect_to request.referer
  end

  # def edit
  #   @tweet = Tweet.find(params[:id])
  #   render json: @tweet
  #   # authorize @tweet
  # end

  def update
    @tweet = Tweet.find(params[:id])
    # @tweet.user = current_user
    @tweet.update(tweet_params)

    render json: @tweet
    # redirect_to root_path
  end

  # delete /tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    head :no_content
    #   authorize @tweet
    #   redirect_to '/tweets'
  end
end

  private

#   def tweet_params
#     params.require(:tweet).permit(:body, :user_id)
#   end
