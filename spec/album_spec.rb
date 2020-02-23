require 'rails_helper'

RSpec.describe 'GET /albums', type: :request do
    
let(:user) { Fabricate(:user) }
let(:user2) { Fabricate(:user) }
let(:url) { '/login' }
let(:params) do
    {
        user: {
            username: user.username,
            email: user.email,
            password: user.password
        }
    }
end
let(:params2) do
  {
      user: {
         username: user.username,
         email: user.email,
         password: user.password
      }
  }
end


context 'you must be authorized to perform any crud on albums' do
  it "doesn't allow any unauthorized requests to the albums controller" do
    get '/albums' 
    expect(response.status).to eq 401
    get '/albums/1'
    expect(response.status).to eq 401
    post '/albums', params: { album: {name: 'album', release_date: '01/01/1990', label: 'something records', cover_url: 'www.image.com', popularity: (0..100), artist_id: (0..100)}} 
    expect(response.status).to eq 401
    patch '/albums/1', params: {album: {name: 'album', release_date: '01/01/1990', label: 'something records', cover_url: 'www.image.com', popularity: (0..100), artist_id: (0..100)}}
    expect(response.status).to eq 401
    delete '/albums/1'
    expect(response.status).to eq 401
  end

end

  context 'authenticated users can only create/update their own resources' do
    let(:albumsURL) { '/albums' }
    before do
      
      post '/login', params: params
      @token = response.headers['Authorization'] 
      post '/login', params: params2
      @token2 = response.headers['Authorization'] 
    end

    it 'returns a 404 for unfound albums' do 
      get '/albums/1000', headers: { Authorization: @token}
      expect(response.status).to eq 404
    end

    it 'allows an user to view only their own albums' do
      get albumsURL, headers: { Authorization: @token }
      body1 = JSON.parse(response.body)
      # p body1
      expect(body1.length).to eq 2
      expect(body1.first['user_id']).to eq 1
      expect(body1.last['user_id']).to eq 1

      get albumsURL, headers: { Authorization: @token2}
      body2 = JSON.parse(response.body)
      # p body2
      expect(body2.length).to eq 2
      expect(body2.first['user_id']).to eq 2
      expect(body2.last['user_id']).to eq 2
    end

    it 'prevents an user from updating a album which is not theirs' do
      patch '/albums/3', params: {album: {name: "DNE"}}, headers: {Authorization: @token}
      expect(response.status).to eq 401
    end


    it 'stops someone who is not the user from deleting a album' do
      delete '/albums/3', headers: { Authorization: @token}
      expect(response.status).to eq 401
    end

    it 'prevents someone from viewing a album which is not theirs' do
      get '/albums/1', headers: { Authorization: @token2 }
      expect(response.status).to eq 401
    end

  end
end