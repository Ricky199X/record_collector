class User < ApplicationRecord

      has_secure_password
      
      has_many :user_albums
      has_many :albums
      has_many :artists
      has_many :albums, through: :user_albums
      has_many :artists, through: :user_albums
     

end
