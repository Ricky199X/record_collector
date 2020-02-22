class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable,
      :jwt_authenticatable,
      :registerable,
      jwt_revocation_strategy: JwtBlacklist

      has_many :user_albums
      has_many :albums
      has_many :artists
      has_many :albums, through: :user_albums
      has_many :artists, through: :user_albums
     

end
