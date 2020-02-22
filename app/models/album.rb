class Album < ApplicationRecord
   belongs_to :artist
   has_many :songs
   has_many :user_albums
   has_many :users, through: :user_albums
   

end
