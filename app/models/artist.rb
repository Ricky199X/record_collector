class Artist < ApplicationRecord
   has_many :albums
   has_many :songs, through: :albums
   has_many :user_albums
   has_many :users, through: :user_albums

end
