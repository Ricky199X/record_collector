class UserAlbumsController < ApplicationController

   # before_action :authenticate_user!

   def index
      albums = current_user.albums
      render json: AlbumSerializer.new(albums)
   end


   def show
      album = Album.find(params[:id])
      authorize_user_resource(album)
      options = {
         include: [:album]
      }
      render json: AlbumSerializer.new(album, options)
   end


   def create
      album = Album.new(album_params)
      album.user = current_user
      album.save
      render_resource(album)
   end


   def destroy
      album = Album.find(params[:id])
      authorize_user_resource(album)
      album.destroy
      render_resource(album)
   end

   private 

   def album_params
      params.require(:album).permit(:name, :release_date, :label, :cover_url, :popularity, :artist_id)
   end
   

end
