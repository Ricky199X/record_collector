class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :encrypted_password, :username
end
