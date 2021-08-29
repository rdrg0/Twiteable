require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'get index' do
    it 'returns http success' do
      User.create(username: 'test', name: 'test', email: 'test@gmail.com', password: '123456')
      get '/api/users'
      # user = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'show path' do
    it 'respond with the correct user' do
      user = User.create(username: 'test', name: 'test', email: 'test@gmail.com',
                         password: '123456')
      get api_user_path(user)
      actual_user = JSON.parse(response.body)
      expect(actual_user['id']).to eql(user.id)
    end

    it 'respond with http success status code' do
      user = User.create(username: 'test', name: 'test', email: 'test@gmail.com',
                         password: '123456')
      get api_user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'returns http status not found' do
      get '/api/users/:id', params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'create user' do
    it 'created a new user' do
      post '/api/users',
           params: { user: { username: 'test', name: 'test', email: 'test@gmail.com',
                             password: '123456' } }
      expect(response).to have_http_status :ok
    end
  end

  describe 'update a user' do
    it 'update a user' do
      user = User.create(username: 'test', name: 'test', email: 'test@gmail.com',
                         password: '123456')
      patch api_user_path(user),
            params: { user: { username: 'test', name: 'test2', email: 'test@gmail.com',
                              password: '123456' } }
      expect(User.last['name']).to eq 'test2'
    end

    it 'returns HTTP status ok' do
      user = User.create(username: 'test', name: 'test', email: 'test@gmail.com',
                         password: '123456')
      patch api_user_path(user),
            params: { user: { username: 'test', name: 'test', email: 'test@gmail.com',
                              password: '123456' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'destroy a user' do
    before(:each) do
      @user = User.create(username: 'test', name: 'test', email: 'test@gmail.com',
                          password: '123456')
    end

    it 'returns HTTP status no content' do
      delete api_user_path(@user)
      expect(response).to have_http_status(:no_content)
    end

    it 'returns empty body' do
      delete api_user_path(@user)
      expect(response.body).to be_empty
    end

    it 'decrement by 1 the total of categories' do
      expect { delete api_user_path @user }.to change(User, :count).by(-1)
    end

    it 'delete the requested user' do
      delete api_user_path(@user)
      expect { User.find(@user.id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
