class AlbumSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :release_date, :label, :cover_url, :popularity, :artist_id

  belongs_to :artist
  has_many :songs
end
