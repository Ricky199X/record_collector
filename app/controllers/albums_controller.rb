class AlbumsController < ApplicationController

   before_action :authenticate_user!

   def index
      albums = Album.all
      render json: AlbumSerializer.new(albums)
   end


   def show
      album = Album.find(params[:id])

      options = {
         include: [:artist, :songs]
      }
      render json: AlbumSerializer.new(album, options)
   end

   def create
      album = Album.new(album_params)
      album.save
      render_resource(album)
   end


   private 

   def album_params
      params.require(:album).permit(:name, :release_date, :label, :cover_url, :popularity, :artist_id)
   end

end
