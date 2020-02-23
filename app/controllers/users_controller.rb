class UsersController < ApplicationController

   # before_action :authenticate_user!

   def index
      users = User.all
      render json: { message: users }
   end

   def show
      user = User.find(params[:id])
      render_resource(user)
      render json: { message: user }
   end


   private

   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end