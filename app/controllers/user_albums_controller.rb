class UserAlbumsController < ApplicationController

   before_action :authenticate_user!


   def index 
      # albums = current_user.albums
      # render json: { message: albums }
      
   end
   

end
