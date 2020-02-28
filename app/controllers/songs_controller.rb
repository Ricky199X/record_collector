class SongsController < ApplicationController

   # NOTE: Not Really using this controller: songs are mostly a nested resource for an album

   # before_action :authenticate_user!

   def index
      if params[:album_id]
         album = Album.find(params[:album_id])
         
         songs = Album.find(params[:album_id]).songs
         render json: SongSerializer.new(songs)
      else 
         songs = Song.all
         render json: SongSerializer.new(songs)
      end
   end

   def show
      song = Song.find(params[:id])
      render json: SongSerializer.new(song)
   end

   private 

   def song_params
      params.require(:song).permit(:name, :duration_ms, :preview_url, :album_id, :artist_id)
   end

end
