class UserAlbumsController < ApplicationController

   # before_action :authenticate

   def index
      if params[:user_id]
         binding.pry
         user = User.find(params[:user_id])
         # require_auth(user)
         user_albums = user.albums
         # binding.pry
         render json: user_albums
      end
   end


   def show
      current_user = User.find(params[:user_id])
      if current_user
         user_album = UserAlbum.find(params[:id])
         options = {
            include: [:album, :artist, :songs]
         }
         render json: UserAlbumSerializer.new(user_album, options)
      else
         render json: { message: "You are not authorized to view this content!"}, status: 400
      end
   end

   def create 
      current_user = User.find(params[:user_id])
      if current_user
         user_album = UserAlbum.new(user: current_user, album: Album.find(params[:album][:id]), artist: Artist.find(params[:album][:attributes][:artist_id]))
         user_album.save
         if user_album
            render json: UserAlbumSerializer.new(user_album)
         else 
            render json: { message: 'oops!' }, status: 400
         end
      end
   end
  


   # def destroy
   #    current_user = User.find(params[:user_id])
   #    if current_user
   #       binding.pry
   #       user_album = current_user.user_albums.find(params[:id] === album_id)
   #       # binding.pry
   #       user_album.destroy
   #    end
   # end

   private 

   def user_album_params
      params.require(:user_album).permit(:user_id, :album_id)
   end
   

end
