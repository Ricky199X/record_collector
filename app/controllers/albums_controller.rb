class AlbumsController < ApplicationController

   def index
      albums = Album.all
      render json: { message: albums }
   end

end
