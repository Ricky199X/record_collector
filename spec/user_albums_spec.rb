# RSpec.describe 'GET /albums', type: :request do
    
#    let(:user) { Fabricate(:user) }
#    let(:user2) { Fabricate(:user) }
#    let(:url) { '/login' }
#    let(:params) do
#        {
#            user: {
#                username: user.username,
#                email: user.email,
#                password: user.password
#            }
#        }
#    end
#    let(:params2) do
#      {
#          user: {
#             username: user.username,
#             email: user.email,
#             password: user.password
#          }
#      }
#    end
   
#    # byebug
   
#    context 'you must be authorized to perform any crud on albums' do
#      it "doesn't allow any unauthorized requests to the user_albums controller" do
#        get '/user/albums' 
#        expect(response.status).to eq 401
#        get '/user/albums/1'
#        expect(response.status).to eq 401
#      end
   
#    end
   
#      context 'authenticated users can only create/update their own resources' do
#        let(:albumsURL) { '/albums' }
#        before do
         
#          post '/login', params: params
#          @token = response.headers['Authorization'] 
#          post '/login', params: params2
#          @token2 = response.headers['Authorization'] 
#        end
   
#        it 'returns a 404 for unfound albums' do 
#          get '/albums/1000', headers: { Authorization: @token}
#          expect(response.status).to eq 404
#        end
   
#        it 'allows an user to view only their own albums' do
#          get albumsURL, headers: { Authorization: @token }
#          body1 = JSON.parse(response.body)
#          # p body1
#          expect(body1.length).to eq 2
#          expect(body1.first['user_id']).to eq 1
#          expect(body1.last['user_id']).to eq 1
   
         
   
#          get albumsURL, headers: { Authorization: @token2}
#          body2 = JSON.parse(response.body)
#          # p body2
#          expect(body2.length).to eq 2
#          expect(body2.first['user_id']).to eq 2
#          expect(body2.last['user_id']).to eq 2
#        end
   
#        it 'prevents someone from viewing a album which is not theirs' do
#          get '/albums/1', headers: { Authorization: @token2 }
#          expect(response.status).to eq 401
#        end
   
#      end