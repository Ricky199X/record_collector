class SongsController < ApplicationController

   # NOTE: THIS CONTROLLER IS MEANT TO BE 

   # before_action :authenticate_user!

   def index
      songs = songs.all
      render json: SongSerializer.new(songs)
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
