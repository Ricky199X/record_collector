class ArtistsController < ApplicationController

   # authenticate to make sure a valid user is able to access the resources
   before_action :authenticate_user!

   # show all artists
   def index 
      artists = Artist.all
      render json: { message: artists }
   end


   # show individual artist + their catalogue
   def show
      artist = Artist.find(params[:id])
      authorize_user_resource(album)
      render_resource(artists, with: [:albums])
   end


end
