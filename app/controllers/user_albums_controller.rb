class UserAlbumsController < ApplicationController

   # before_action :authenticate

   def index
      if params[:user_id]
         user = User.find(params[:user_id])
         # require_auth(user)
         user_albums = user.albums
         # binding.pry
         render json: user_albums
      end
   end


   # def show
   #    user = User.find(params[:user_id])
   #    require_authorized_user(user)
   #       user_album = UserAlbum.find(params[:id])
   #       options = {
   #          include: [:album]
   #       }
   #       render json: UserAlbumSerializer.new(user_album, options)
   #    # else
   #    #    render json: { message: "You are not authorized to view this content!"}, status: 400
   #    # end
   # end

   def create 
      current_user = User.find(params[:user_id])
      require_authorized_user(user)
      user_album = UserAlbum.new(user: current_user, album: Album.find(params[:album][:id]), artist: Artist.find(params[:album][:attributes][:artist_id]))
      user_album.save
      if user_album
         render json: UserAlbumSerializer.new(user_album)
      else 
         render json: { message: 'oops!' }, status: 400
      end
   end
  


   # def destroy
   #    album = Album.find(params[:id])
   #    require_authorized_user(user)
   #    album.destroy
   #    render_resource(album)
   # end

   private 

   def user_album_params
      params.require(:user_album).permit(:user_id, :album_id)
   end
   

end
