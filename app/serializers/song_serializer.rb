class SongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :duration_ms, :preview_url, :album_id, :artist_id

  belongs_to :album
end
