class UserAlbumsController < ApplicationController

   # before_action :authenticate_user!

   def index
      # user = User.find(params[:user_id])
      # albums = user.albums
      # binding.pry
      # render json: UserAlbumSerializer.new(albums)

      if params[:user_id]
         user_albums = User.find(params[:user_id]).user_albums
         render json: UserAlbumSerializer.new(user_albums)
      else 
         user_albums = UserAlbum.all
         render json: UserAlbumSerializer.new(user_albums)
      end
   end


   def show
      # if authorized_user?
         
         user_album = UserAlbum.find(params[:id])
         options = {
            include: [:album]
         }
         render json: UserAlbumSerializer.new(user_album, options)
      # else
      #    render json: { message: "You are not authorized to view this content!"}, status: 400
      # end
   end

   # params[:album][:attributes][:artist_id]

   def create 
      current_user = User.find(params[:user_id])
      user_album = UserAlbum.new(user: current_user, album: Album.find(params[:album][:id]), artist: Artist.find(params[:album][:attributes][:artist_id]))
      user_album.save
      if user_album
         render json: UserAlbumSerializer.new(user_album)
      else 
         render json: { message: 'oops!' }, status: 400
      end
   end
  


   def destroy
      album = Album.find(params[:id])
      authorize_user_resource(album)
      album.destroy
      render_resource(album)
   end

   private 

   # def user_album_params
   #    params.require(:user_album).permit(:user_id, :album_id)
   # end
   

end
