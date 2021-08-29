require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'index path' do
    it 'repsond with http success status code' do
      get '/api/tweets'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a json with all tweets' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      Tweet.create(body: 'Test', user_id: User.first.id)
      get '/api/tweets'
      tweets = JSON.parse(response.body)
      expect(tweets.size).to eq 1
    end
  end

  describe 'show path' do
    it 'respond with http success status code' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      tweet = Tweet.create(body: 'Test', user_id: User.first.id)
      get api_tweet_path(tweet)
      expect(response).to have_http_status(:ok)
    end

    it 'respond with the correct tweet' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      tweet = Tweet.create(body: 'Test', user_id: User.first.id)
      get api_tweet_path(tweet)
      actual_tweet = JSON.parse(response.body)
      expect(actual_tweet['id']).to eql(tweet.id)
    end

    it 'returns http status not found' do
      get '/api/tweets/:id', params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'create path' do
    it 'created a new tweet' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      post '/api/tweets', params: { tweet: { body: 'test2', user_id: User.first.id } }
      expect(response).to have_http_status :ok
    end

    it 'increment by one count tweets' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      expect do
        post '/api/tweets',
             params: { tweet: { body: 'test2', user_id: User.first.id } }
      end.to change(Tweet, :count).by(+1)
    end
  end

  describe 'update a tweet' do
    it 'update a tweet' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      tweet = Tweet.create(body: 'Test', user_id: User.first.id)
      patch api_tweet_path(tweet),
            params: { tweet: { body: 'test2', user_id: User.first.id } }
      expect(Tweet.last['body']).to eq 'test2'
    end

    it 'returns HTTP status ok' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      tweet = Tweet.create(body: 'Test', user_id: User.first.id)
      patch api_tweet_path(tweet),
            params: { tweet: { body: 'test2', user_id: User.first.id } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'destroy a tweet' do
    before(:each) do
      @user = User.create(username: 'test', name: 'test', email: 'test@gmail.com',
                          password: '123456')
      @tweet = Tweet.create(body: 'Test', user_id: @user.id)
    end

    it 'returns HTTP status no content' do
      delete api_tweet_path(@tweet)
      expect(response).to have_http_status(:no_content)
    end

    it 'returns empty body' do
      delete api_tweet_path(@tweet)
      expect(response.body).to be_empty
    end

    it 'decrement by 1 the total of categories' do
      expect { delete api_tweet_path @tweet }.to change(Tweet, :count).by(-1)
    end

    it 'delete the requested tweet' do
      delete api_tweet_path(@tweet)
      expect { Tweet.find(@tweet.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
