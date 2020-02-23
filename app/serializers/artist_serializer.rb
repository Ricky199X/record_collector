class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :genre, :photo_url
end
