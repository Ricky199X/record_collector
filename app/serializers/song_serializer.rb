class SongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :duration_ms, :preview_url, :album_id, :artist_id
end
