class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :encrypted_password, :username

  has_many :user_albums
end
