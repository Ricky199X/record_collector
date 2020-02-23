class SongsController < ApplicationController

   before_action :authenticate_user!

   def index
      albums = current_user.albums
      songs = albums.songs
      render_resource(songs)
   end

   def show
      song = Song.find(params[:id])
      render_resource(song)
   end

   private 

   def song_params
      params.require(:song).permit(:name, :duration_ms, :preview_url, :album_id, :artist_id)
   end

end
