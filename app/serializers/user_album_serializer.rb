class UserAlbumSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :album_id, :artist_id
end
