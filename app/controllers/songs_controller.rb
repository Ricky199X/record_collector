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
   
end
