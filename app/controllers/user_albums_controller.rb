class UserAlbumsController < ApplicationController

   # before_action :authenticate_user!


   def index 
      albums = current_user.albums
      render json: albums.to_json(include: [:songs])
      
   end
   

end
