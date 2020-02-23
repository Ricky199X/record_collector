class ArtistsController < ApplicationController

   # authenticate to make sure a valid user is able to access the resources
   before_action :authenticate_user!

   # show all artists
   def index 
      artists = Artist.all
      render json: ArtistSerializer.new(artists)
   end


   # show individual artist + their catalogue
   def show
      artist = Artist.find(params[:id])
      authorize_user_resource(artist)

      options = {
         include: [:albums, :users]
      }
      render json: ArtistSerializer.new(artist, options)
   end


   private 

   def artist_params
      params.require(:artist).permit(:name, :genre, :photo_url)
   end

end
