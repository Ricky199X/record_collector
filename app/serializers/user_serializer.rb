class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :username

  has_many :user_albums
end
