class AlbumsController < ApplicationController

   before_action :authenticate_user!

   def index
      albums = Album.all
      render json: albums
   end


   def show
      album = Album.find(params[:id])
      render json: album.to_json(include: [:songs])
   end


   private 

   def album_params
      params.require(:album).permit(:name, :release_date, :label, :cover_url, :popularity, :artist_id)
   end

end
