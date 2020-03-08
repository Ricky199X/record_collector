class UserAlbumSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :user_id, :album_id, :artist_id

  belongs_to :user
  belongs_to :album
end
