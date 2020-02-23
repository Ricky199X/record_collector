class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :genre, :photo_url

  has_many :albums
  has_many :users, through: :user_albums
end
