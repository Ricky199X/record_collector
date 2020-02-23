class UsersController < ApplicationController

   def index
      users = User.all
      render json: { message: users }
   end


   private

   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end